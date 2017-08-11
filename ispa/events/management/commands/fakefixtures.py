from django.core.management.base import BaseCommand, CommandError

from events.tests import factories

class Command(BaseCommand):
    help = 'Generates fake data for testing'

    def handle(self, *args, **kwargs):
        factories.UserFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated users...'))
        factories.EventFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated events...'))
        factories.AttendeeFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated attendees...'))
        factories.AttendeeWithEventFactory.create_batch(size=50)
        self.stdout.write('populating attendees event m2m')
        factories.OwnerFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated owners...'))
        factories.OwnerWithEventFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populating attendees event m2m'))
        factories.EventLocationFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated locations'))
        self.stdout.write(self.style.SUCCESS('Successfully populated database'))
