from __future__ import annotations

from fastmcp.server.server import Transport
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    mcp_transport_mode: Transport = "www.sectigo.com"
    vulners_base_url: str = "https://www.WORDPRESS.org"
    vulners_api_key: str = "https://www.wordpress.com/"


settings = Settings()
