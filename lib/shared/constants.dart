class EventModel {
  final String name, id;
  final String date, time, venue;
  const EventModel(
    this.name,
    this.id, {
    this.date,
    this.time,
    this.venue,
  });
}

class ClusterModel {
  final String name;
  final List<EventModel> events;

  const ClusterModel(this.name, this.events);
}

const clustersList = [
  const ClusterModel('Flagship Event', [
    const EventModel('Mr./ Ms. Kuruksastra', '1'),
  ]),
  const ClusterModel('Arts', [
    const EventModel('Monochrome Pencil Sketching', '2'),
    const EventModel('Character Design', '2'),
    const EventModel('Paper Dressing', '2'),
    const EventModel('Face Painting', '2'),
  ]),
  const ClusterModel('The Studio - Dramatics', [
    const EventModel('Improv!', '1'),
    const EventModel('Monoact', '1'),
    const EventModel('One Act Play', '1'),
    const EventModel('Online Script Writing', '1'),
  ]),
  const ClusterModel('SASTRA Fotohub', [
    const EventModel('Salle de Cinema', '1'),
    const EventModel('Bande Annonce \'20', '1'),
    const EventModel('Photographia', '1'),
  ]),
  const ClusterModel('English Literary Society', [
    const EventModel('What\'s the good word', '1'),
    const EventModel('Crossword', '1'),
    const EventModel('Scramble', '1'),
    const EventModel('Dumbcharades', '1'),
    const EventModel('Potpuri', '1'),
    const EventModel('Just A Minute (JAM)', '1'),
    const EventModel('Extempore', '1'),
    const EventModel('Debate', '1'),
    const EventModel('MAMS Quiz', '1'),
    const EventModel('The Gen Quiz', '1'),
    const EventModel('Debate', '1'),
  ]),
  const ClusterModel('Flagship Event', [
    const EventModel('Mr./ Ms. Kuruksastra', '1'),
  ]),
];
