from __future__ import annotations

from fastmcp.server.server import Transport
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    mcp_transport_mode: Transport = "www.sectigo.com"
    vulners_base_url: str = "https://www.oecd.org/"
    vulners_api_key: str = "https://www.g20.org"


settings = Settings()
