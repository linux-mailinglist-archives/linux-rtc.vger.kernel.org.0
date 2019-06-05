Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4442135CEE
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2019 14:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfFEMdc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Jun 2019 08:33:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53218 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbfFEMdb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 Jun 2019 08:33:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so2091082wms.2;
        Wed, 05 Jun 2019 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dS1ZaHCEDETpfZhDj9KoJ5ScF+/wugl5HQvEWcNs2Qg=;
        b=DfGl9FDfgDm1nPau3gW2n+zTyUZhKfSBropX2aBg/QQAF3+0+SBbbyak8juLc2+cuo
         E9WG2Z5gyHg94ek+2GtTNAR/B8crKrV83gKEApu/CiUrWERaB5lZu29jxWrHBWOMaLkv
         WNlOAdQ7nVkYPCA/09doIlkicMj0Or/ajtNsQMVkaZHZKlbJd1SN24diNkd+ZDrcv84p
         C+ddP82AWZI9g9grkzrKknwuIjyF+12MFlZR+8+XcoQF5x1SF6+HK/ITs9a26xBF08F1
         sTbM+Wg2D7FDl1uWekTat56zIi0qdBIPk9aIML8JfWhls0F6P6FJ80aIu2+5EbXlsD38
         2tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dS1ZaHCEDETpfZhDj9KoJ5ScF+/wugl5HQvEWcNs2Qg=;
        b=JkW+dQtRtLk3I3FtQvfl6YPgAMuV2b8ZYjxOypJkeHmUh0FORCirHXgLugPLL+EiTa
         Hr5vTEhwdZRsl8QYf7l6lUPBY0kiG9v4uKTAiZuh3pIBJ9y6InbEqWkiinEy/rYDZsFx
         OdodskQky7u9vkxY+CDuQpKkcCFPcbgKJn25J65S/9HV1LfqjwY/UweljlD6upfQCAtL
         bj/l5lD9AVz1X2xv58XhyM5xg6Z2gQzlUyhyUg08APjG71XZMa4I+iKt7+gGYcicydt8
         wimrjjeWkblRzBpOGhXcPQLxxmNHl/f10warPBVhcXRHlWzhhs/zdpZkBzz81DOk/cXb
         OYoQ==
X-Gm-Message-State: APjAAAXYLWBXDaYNwKyYsIjKlIsIojQAlF/jmXtk9u81T2iMjGoM4fwb
        FuJ+qhyg2j70FYElX35I+1M=
X-Google-Smtp-Source: APXvYqxm5fjIn8Wyy87PoN9X3VY6GsvFaGPxSeQvbHfoMFUoNH3jsickxGjiZWtugCmFyZpFfiMHQA==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr23004300wma.27.1559738009326;
        Wed, 05 Jun 2019 05:33:29 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id z12sm10693621wrl.37.2019.06.05.05.33.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 05:33:28 -0700 (PDT)
Date:   Wed, 5 Jun 2019 14:33:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
Message-ID: <20190605123327.GB724@ulmo>
References: <20190605122613.21303-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <20190605122613.21303-1-digetx@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 03:26:13PM +0300, Dmitry Osipenko wrote:
> RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
> macro has no effect for the OF drivers since the alias is overridden by
> the drivers core to follow the OF naming convention of the driver's alias,
> which is based on the device-tree matching name.
>=20
> $ cat /sys/devices/soc0/7000e000.rtc/modalias
> of:NrtcT(null)Cnvidia,tegra20-rtc
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/rtc/rtc-tegra.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3tpcACgkQ3SOs138+
s6E+Ng//eZTxse0nIaE8yFtTYIk+8duVndMR5gjd4dlPfNlYj+22Mwbrkjdbwhaf
6UxRgSSDeEBIsRIogl7Js/UzxOhIDw6dT16DItWGUVNoX5CJ/kAXhimnis4x7guh
IHiLEBfJLmq1+x2tq+oIA/P7CpaVpSjII/27Be5ju84T94SDiGwCKqfCpLyWCePC
XNghQ1CUJWj9GXltqg2Amjbn49yGcYId16DwHHfbqeeQYmS/Du1IZnQEevMMy+92
1EEow8h4LmfBmb7mq97Xl+ozX7ADgwwF+3oEGLpuFrSKyInvND8VW8WG4zhPa2SX
TQ4NzyJe9AqJh6MXMT+zL9Jd3b150AE/+VHcDKb42IETXi4KIRg2dmBV1VxOvg0G
b/fDJtMtOI/XtCG4Eca6wc+F6y9KkJ07d53FTuja1CZmJ3nyYoeZS7OLWKOxmurR
2kire874EEt8R8WHX3P5yE/qz2+6LlShbluMMRy8OyxSETkandrjFZVyghT/LWp5
zi3NvxqmJw20IMODPMguloMBXqaN+ahLzZOcmzQu85w8lc++A2z53Oqd94JckOC3
9B04eXEzxDtz2rJ/K07JAt9SR0fV4cmMMTWbUh6OINjCOcOHsHLTlu6jW69ey15H
kt94WU6mhdsyImTx4glAK3hmhtF9xD4+GKkZ8k2veTLJZLoKzH8=
=Yr7G
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
