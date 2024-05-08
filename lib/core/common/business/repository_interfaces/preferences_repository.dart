import '../entities/preferences_entity.dart';

abstract class IPreferencesRepository {
  Future<PreferencesEntity> getPreferences();

  Future<void> updatePreferences(PreferencesEntity updatedPreferences);
}