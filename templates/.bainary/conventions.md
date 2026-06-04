# Conventions

> Naming, folder structure, and styling rules for this project.

## Naming

| Type | Convention | Example |
|------|-----------|---------|
| Components | PascalCase | `UserCard`, `NavBar` |
| Hooks | camelCase with `use` prefix | `useAuth`, `useLocalStorage` |
| Utilities | camelCase | `formatDate`, `slugify` |
| Constants | UPPER_SNAKE_CASE | `API_BASE_URL`, `MAX_RETRIES` |
| Types/Interfaces | PascalCase | `UserProfile`, `ApiResponse` |
| Files | match default export | `UserCard.tsx`, `useAuth.ts` |
| CSS classes | <!-- e.g. kebab-case or Tailwind utility --> | |

## Folder Structure

```
src/
├── components/     # Reusable UI components
├── pages/          # Route-level pages (or app/ for Next.js App Router)
├── hooks/          # Custom React hooks
├── lib/            # Utility functions, helpers
├── services/       # API calls, external service wrappers
├── types/          # TypeScript type definitions
├── store/          # State management
└── styles/         # Global styles
```

## Import Order

```typescript
// 1. Node built-ins
// 2. External packages
// 3. Internal absolute imports (@/components/...)
// 4. Relative imports (./Button)
// 5. Type imports
```

## Component File Structure

```typescript
// 1. Imports
// 2. Types/Props interface
// 3. Component function
// 4. Helper functions (if small and component-specific)
// 5. Default export
```

## CSS / Styling

<!-- Describe styling approach: Tailwind, CSS Modules, styled-components, etc. -->

## Commit Messages

```
feat: add user profile page
fix: resolve login redirect loop
refactor: extract auth logic to useAuth hook
style: format components with prettier
docs: update .bainary/patterns.md
chore: update dependencies
```
