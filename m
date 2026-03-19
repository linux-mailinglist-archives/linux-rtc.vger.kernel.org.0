Return-Path: <linux-rtc+bounces-6232-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH25H3T+u2mzqwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6232-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Mar 2026 14:47:32 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 985192CC295
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Mar 2026 14:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 141B3300F791
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Mar 2026 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D47D2D3A60;
	Thu, 19 Mar 2026 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Wjg+5HA2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1842980A8;
	Thu, 19 Mar 2026 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928044; cv=none; b=QhXZVfBLf0XX9Kakwe2USZJeCykzoB0Ndq0TLwnlaqQNQVoHS6+JVZGDTSbHy/imSwwPYVkZEVVK7uEmdG9HR5vf60lFsAQLl4Vaq4X+R4JajRIskjVSs5fusxgRV2tl8T/RZhqYDV+GvM/uVZqsJMAI74tXPMgXlmSinEPVIRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928044; c=relaxed/simple;
	bh=ksvyivwMMcfAco4JH1SNvzalhs1WV6ffPUpIeWy4SQ8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 MIME-Version:Date; b=QrXcxpxjp7KPIuM1SXp1U/6YyvY8utgtYFvuX6GdzNmdFW9GmmhUpI7EogPU1tyOyOsyATJ9dH/Npow7WCIfaGqPB79suyFi/sNOvK3ApjqRlDiqBXzjPtDRK1d2Rn4H+PPDc527e3Nuz8+xHlnOVV9VrIty6+hENMBvRF2z1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=Wjg+5HA2; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1773927515;
	bh=ksvyivwMMcfAco4JH1SNvzalhs1WV6ffPUpIeWy4SQ8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Wjg+5HA2DcTy7ImzDCfL/hiwNCW3P+AT+sac3h1AcSSNPOrO713uAzTj+LGFyQIFN
	 qZw7s81n5YdPRSxoA+qWuuOqKcdY5sAKCEH1+bgXIPB6PDV/AKYCjaJZ38qyuU8n+E
	 +NbUAIZRrQvXeRWqEhXISlJM+aOu9BAoOryWWTIM=
Message-ID: <5a390e368fa74f7f96bcceefea34af306d768929.camel@crapouillou.net>
Subject: Re: [PATCH 05/15] dt-bindings: rtc: ingenic,rtc: Use generic
 power-controller schema
From: Paul Cercueil <paul@crapouillou.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki"	 <rafael@kernel.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, Florian Fainelli	
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>, Lee
 Jones <lee@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>,  Jerome
 Neanne <jerome.neanne@baylibre.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>,  Chris
 Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Sebastian Reichel	 <sebastian.reichel@collabora.com>, Andreas Kemnade
 <andreas@kemnade.info>,  Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=	
 <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, Julien Panis	
 <jpanis@baylibre.com>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Alexander Kurz <akurz@blala.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 	linux-rtc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260316-power-controller-v1-5-92c80e5e1744@nxp.com>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
	 <20260316-power-controller-v1-5-92c80e5e1744@nxp.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Mar 2026 12:12:52 +0100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[crapouillou.net,none];
	R_DKIM_ALLOW(-0.20)[crapouillou.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6232-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,kernel.org,linaro.org,broadcom.com,gmail.com,ti.com,baylibre.com,bootlin.com,sntech.de,rock-chips.com,collabora.com,kemnade.info,gmx.net,v3.sk,blala.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@crapouillou.net,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[crapouillou.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_TWELVE(0.00)[39];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 985192CC295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Le lundi 16 mars 2026 =C3=A0 22:47 +0800, Peng Fan (OSS) a =C3=A9crit=C2=A0=
:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the binding to use the generic power-controller schema
> instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml | 7 +------
> =C2=A01 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> index
> de9879bdb3175a7e0f24304b5a084a8faa233c46..415566d8dba564ebad976689596
> bbcd699ed6021 100644
> --- a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> @@ -11,6 +11,7 @@ maintainers:
> =C2=A0
> =C2=A0allOf:
> =C2=A0=C2=A0 - $ref: rtc.yaml#
> +=C2=A0 - $ref: /schemas/power/power-controller.yaml#
> =C2=A0=C2=A0 - if:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> @@ -53,12 +54,6 @@ properties:
> =C2=A0=C2=A0 "#clock-cells":
> =C2=A0=C2=A0=C2=A0=C2=A0 const: 0
> =C2=A0
> -=C2=A0 system-power-controller:
> -=C2=A0=C2=A0=C2=A0 description: |
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Indicates that the RTC is responsible for=
 powering OFF
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the system.
> -=C2=A0=C2=A0=C2=A0 type: boolean
> -
> =C2=A0=C2=A0 ingenic,reset-pin-assert-time-ms:
> =C2=A0=C2=A0=C2=A0=C2=A0 minimum: 0
> =C2=A0=C2=A0=C2=A0=C2=A0 maximum: 125

