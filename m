Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9EBA45EA4
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 15:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfFNNmz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 09:42:55 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33794 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbfFNNmz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 09:42:55 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so8950417wmd.1;
        Fri, 14 Jun 2019 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l/PhgC367WTW48nTE7CUMgv0FnvzQmGarbQubvNhqIU=;
        b=rlY+TuF0/77h4XOCRM4yyvkPFGQGl0v1lkkSkMgTxowZ+mpd4xqtqM8sBeiKEqP6l6
         zerzbm8PybaQFLC+CT84UN4i8at1bm+7aj0ByayZXWWg/qlAkbhUv/hJklsk2DGm29n8
         uba7kZqoG25ZzEyr0+Q3lg5NOyOqjyW0WmcGTY5Q5d09LJUcSiRHdq92fq7vOt63GLLi
         yF6K9ak5pYYhnTsOsPiK1Ijxcp44LMcd8SsLfao+6LVnQxJu4Oobw3vfxY1B5qoHnlOJ
         zWxIC4yobagxB1rkVMCMIprvv+GW85iGC9KPbXvhxO7FSsbGp97CuMmg02iqsmwHUaon
         N7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l/PhgC367WTW48nTE7CUMgv0FnvzQmGarbQubvNhqIU=;
        b=kGrXjy7A5H8WStNBVOr6mK5KzJUp6pUArnS1Q0sm65xhC99IfIxTR7Z+uqAlcE+9De
         fQx9IsCpR2te2zvA2+frXxFO6HMpb9g8nq6lL5caGwzOmRtAqC5hdmVvZryHMDYHbp1y
         nFJUc1Ee7c39bBajCt0bbA3yJDwTs3ZBPneiEIQgb/QxYG0ZNVJ/UnyIU8gmuFjxo6Mu
         UGc2FlW1WnRsW+DLcDe7OgeM/9aTmTodDhTU2HVLeHX4I+KEfgmv7pGlnWOvkE2PeeCp
         NL1L+l6jU7mDUWlenhqlsUmgg9AfFA6+QZp1rD+5ZMSLuxcxY9nR2cac97yRFVHGGcMc
         p9AQ==
X-Gm-Message-State: APjAAAUVGjm+SUCEZyY8+BVP3HWaz4pm9AMwvLbDXV1BV721HNypEdQ4
        RmxtcfTIMymz8s+hx+tkmAI=
X-Google-Smtp-Source: APXvYqyliIUpKWGpzVravQmng2PLhnquSdAXIhYNYAbPBuuMJjdrxM7gB7THAsWqEYvQnUz3TC2pnw==
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr8068724wmf.19.1560519772962;
        Fri, 14 Jun 2019 06:42:52 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 74sm3616332wma.7.2019.06.14.06.42.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 06:42:52 -0700 (PDT)
Date:   Fri, 14 Jun 2019 15:42:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Message-ID: <20190614134251.GG15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <d3de8c42-3718-d87d-3c38-af18c671036c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m972NQjnE83KvVa/"
Content-Disposition: inline
In-Reply-To: <d3de8c42-3718-d87d-3c38-af18c671036c@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--m972NQjnE83KvVa/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 03:35:14PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The suspend clock source for Tegra210 and earlier is currently
> > implemented in the Tegra timer driver. However, the suspend clock source
> > code accesses registers that are part of the RTC hardware block, so both
> > can step on each others' toes. In practice this isn't an issue, but
> > there is no reason why the RTC driver can't implement the clock source,
> > so move the code over to the tegra-rtc driver.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
>=20
>=20
> [snip]
>=20
> > +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
> > +{
> > +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> > +}
>=20
> Shouldn't hurt to inline this function explicitly because I assume that i=
t won't get
> inlined with a certain kernel configurations, like with enabled ftracing =
for example.

Yeah, makes sense.

Thierry

--m972NQjnE83KvVa/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DpFsACgkQ3SOs138+
s6EplBAAp8fChDDGmbZBfVk6Q2l6B+DVSC/xTILCrCILX0/KF7FAW2txps1x3BZR
8H5XNqJ48V2bmQbPG2bG9XpKiVF/2UEYboQEpZ1TVO7ZrZSCUBnPtUZ9qtMpLvFb
rSGMIWLioh0EOYIxMtenMqgzqpQAVSibHwJaH+rmVhdb8u69JpdQc3ipov5OAkrK
YT5ySJ9SOdb59l1Mn//SWIMZ4nbNriCXqIVBkna8BCTHK46qtg2P+wDaRBw/iLev
Rk2N+rqJTsdPjenU2D0aEEupJiWgTP0LX3lbGntHgEnlJOSfVWektOKQb7Qbcsk6
9EZUBzvW00f1aMehNUsCWpp6Cg3QYAiWz5v0CouyyK56vIImtktHLGfeqdxj5Rnt
4wNCyPTzzcfSfHitT2hPKaDXtLcF07e0ariEdoLfFhxrSE/ZhlTYI6yFvLsCoZmu
Ubdvqf49cIx2aulZaVzfzLM9VkxDj3B9wfcsfHsA538O4LSCt8WqD0BqlFEyrCbX
tLxN/S3VmBiXHhSNZ6xzKS4WIh9EzPt6Oau59r+0XMDLCxaJtXMoRd/BAEq++YAL
UmpAQtg+0Thaen3XbfhggYDszn8ZBwk+2JrcgkA7f6qpCK9pudYwOnmrAF2APoiP
rtF8c+lvsdIBI/iZOAq12divdWRrDgQzLQxovgqVdslTjA4ii4k=
=GzBW
-----END PGP SIGNATURE-----

--m972NQjnE83KvVa/--
