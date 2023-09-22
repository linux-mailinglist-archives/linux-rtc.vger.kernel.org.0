Return-Path: <linux-rtc+bounces-10-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0947AB0AE
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 13:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id B8F562826E9
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 11:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FCB1F925;
	Fri, 22 Sep 2023 11:29:47 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A39CA5C;
	Fri, 22 Sep 2023 11:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B11C433C8;
	Fri, 22 Sep 2023 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695382186;
	bh=vMCzTUx26TKgWhN2gEaxZ6nVI3/wNAO4qKKAvWOgWF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWoWfvI84p28gdkLVF/3+aXbldYQp5Pg408ORpkUggKAbXwin474R7XICf4lLvYQl
	 g3z+GHqH3zOsfd7Xgj4Tnk50NJMI0bQoaI/yMMExHSiU7kKJ/iaila565EHXsOJgk3
	 WVgC7GdRTw+/ChgvXCkN1ameun7wK4ZuKsiLTmupHXcfkt7g5LlN1bxGmsT6VPI4xt
	 dQ5PBBXOHzRlrL4t13FC7+P9milLz9r837yPCfMcmLD0Hl99IaRi+xm5hC/I4iYR7K
	 LAx5ijwI6tHfKqcEzQ7HP0er2ybOMtSv/DGniVmiFSA+IaSI95Hox2ahibrbUDfEX0
	 EazUVOU7IpLBw==
Date: Fri, 22 Sep 2023 12:29:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: microcrystal,rv3032: Document
 wakeup-source property
Message-ID: <20230922-urethane-cohesive-aefa04cc9be9@spud>
References: <20230921192604.70944-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V4qcw20PL63m4Tub"
Content-Disposition: inline
In-Reply-To: <20230921192604.70944-1-marex@denx.de>


--V4qcw20PL63m4Tub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 09:26:04PM +0200, Marek Vasut wrote:
> The RV3032 can be used as a wake-up source, document the 'wakeup-source'
> property as allowed property.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Conor Dooley <conor+dt@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.ya=
ml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
> index 27a9de10f0af3..7680089d1d926 100644
> --- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
> @@ -38,6 +38,8 @@ properties:
>        - 3000
>        - 4400
> =20
> +  wakeup-source: true
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.40.1
>=20

--V4qcw20PL63m4Tub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ16pgAKCRB4tDGHoIJi
0u32APsGQ40JE5OdvuhMgl/ISyMq2WjOk+HTjf8FX4G2Ef2gvwD/SUbnzFppjDNW
+3ldYSIq8ld19H4uCuKQ68Vd1VVQLw8=
=D3pG
-----END PGP SIGNATURE-----

--V4qcw20PL63m4Tub--

