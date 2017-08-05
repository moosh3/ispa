from django.core.management.base import BaseCommand, CommandError

from events.tests import factories

class Command(BaseCommand):
    help = 'Generates fake data for testing'

    def handle(self, *args, **kwargs):
        factories.EventLocationFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated eventlocations...'))
        factories.EventFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated events...'))
        factories.UserFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated users...'))
        factories.AttendeeFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated attendees...'))
        factories.OwnerFactory.create_batch(size=50)
        self.stdout.write(self.style.SUCCESS('populated owners...'))
        self.stdout.write(self.style.SUCCESS('Successfully populated database'))
