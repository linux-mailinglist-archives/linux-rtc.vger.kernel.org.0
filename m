Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D450F1CA8E4
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2020 13:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgEHLCf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 May 2020 07:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726519AbgEHLCe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 May 2020 07:02:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89066C05BD43;
        Fri,  8 May 2020 04:02:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z8so1370747wrw.3;
        Fri, 08 May 2020 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FkEHL5zjH9NOXTmK8upd4DOiKhI1dh7AJQdWAx10iwY=;
        b=nK2YQiQhonp8TBWc6SJQNRqvr7zeP+LE21igKDXN4j5VesKJlVCmRjhYHS8JobWE06
         ixAqzm1gXoUMXs3AYjA5wsC1v+EiKr3WvQQ0MD/7NcqqAlFW1DuFGErGsLGZnF4EPDFX
         0+Fr7zGjSHs+RzyNBviNQlfvM/Sfs9icoKyE+WJN+K8F88Wea3uFAornpjZ53yge2MLY
         aDolyAbVZMXeUVHyfBzNC7E481UOo2YllD0m8NqYLkNUVAKvR0iSYtKWMrtThkbtPmRR
         6Ttdvw0IxnkqfCbwaR0phfvfNvCK5KTj06PwrOP9FVq0O4762kGy6xuzbIVD1QBQJ9BB
         Gexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FkEHL5zjH9NOXTmK8upd4DOiKhI1dh7AJQdWAx10iwY=;
        b=g4M93J81oRg58IHWgdRH0QL3i0444JLvtIBPoF2TMR2VDZWiyAp3GZ5VC+M7GJz78d
         GYpxo+DqUb2Y8na8iUizW5cNmWZc1mPabHurG4VuXgt5oIzvO9zw8en0uBXX9gU5Y5Yx
         vEFYF3MdmYqBLLRokJkWSdCRVYMNL1u8vGPodFgLI3ugUwkS6lyg0Wif1aGC+P0w7Okc
         aY9q9ZuIp7jcMAju22Kj83o4UwJRNP6SfiVWwopwjS9XuY6AWnMTOgaBfSyUbWy6yYzL
         Tj8pWDh0o3NxO9kPJhEDIqNvR8I88kDkajWyUYGwSWjUXmB/eMF4F7KwE8kBb/r53OYb
         WBQg==
X-Gm-Message-State: AGi0PubLMngXqGJvzKMZFR1MOp0X7mwj1cRPj+NAqJiSZgTgjlvhNpAh
        OkZnNE/a+unLKk6ZbdVpl6E=
X-Google-Smtp-Source: APiQypIp6YIwXaUa5824wcmZA6NiTZhT6Gn3InjfzNfs5u6CIl1RBWsEt6Jq9rAgWjRRJ2CQI0Z/Dw==
X-Received: by 2002:adf:e591:: with SMTP id l17mr2304234wrm.406.1588935753156;
        Fri, 08 May 2020 04:02:33 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id a81sm5874924wmh.7.2020.05.08.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 04:02:27 -0700 (PDT)
Date:   Fri, 8 May 2020 13:02:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on
 MAX77620
Message-ID: <20200508110226.GA3034719@ulmo>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200430140701.GA21776@bogus>
 <20200430141520.GA101194@piout.net>
 <CAL_Jsq+HzG8QT+kHUjqC8joDxfm1WM+N_F1ZwYXg7cL5faGxVA@mail.gmail.com>
 <20200501135309.GC51277@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <20200501135309.GC51277@piout.net>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2020 at 03:53:09PM +0200, Alexandre Belloni wrote:
> On 01/05/2020 08:00:11-0500, Rob Herring wrote:
> > > I don't think this is true because in the case of a discrete RTC, its
> > > interrupt pin can be connected directly to a PMIC to power up a board
> > > instead of being connected to the SoC. In that case we don't have an
> > > interrupt property but the RTC is still a wakeup source. This is the
> > > usual use case for wakeup-source in the RTC subsystem. Else, if there=
 is
> > > an interrupt, then we assume the RTC is a wakeup source and there is =
no
> > > need to have the wakeup-source property.
> >=20
> > Yes, that would be an example of "unless the wakeup mechanism is
> > somehow not an interrupt". I guess I should add not an interrupt from
> > the perspective of the OS.
> >=20
> > So if the wakeup is self contained within the PMIC, why do we need a
> > DT property? The capability is always there and enabling/disabling
> > wakeup from it is userspace policy.
> >=20
>=20
> Yes, for this particular case, I'm not sure wakeup-source is actually
> necessary. If the interrupt line is used to wakeup the SoC, then the
> presence of the interrupts property is enough to enable wakeup.

So yes, the wakeup-source property isn't necessary. The goal of patches
1 and 2 was to allow the RTC to be actually disabled as a wakeup-source
in case it didn't work as intended. But since the RTC is enabled as a
wakeup source on these PMICs by default, the idea was to add a new sub-
node for the RTC and required the wakeup-source in that subnode if that
subnode was present.

That said, patch 3 actually does make the RTC work as a wakeup source
on the particular board that I tested this, so patches 1 and 2 are no
longer really required from my point of view.

Do you want me to send patch 3/3 again separately or can you pick it up
=66rom this series?

Thanks,
Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl61PD8ACgkQ3SOs138+
s6GV8BAAgLR4lg0g62qMQgR8ZL2stOQFzJoRTr3EOif7vMW34wGNJxEkGewzJGN0
eEuXOqMN5x0bVIqbb1/xETy7P6/38SOUx6PwaaxuFCVCi+XjCdg5lqoYSliMaUcC
LWZnojhwjBiEb5MyesMgZPtAq9zoimroASiCC2MMgadKefm3qhO6dF5l3L46Mscl
63NpGDbQVhmXCzASor/+yzV+x6SjpzFSL61J2bUuaovMcWSBljsiLtMu5z3m39f8
UeQ3brtGLDlXRHMNfPNt9+F7Wtd7oUyfhAhu5lSS2ukSVSZgoID1fX3ctBlunGn/
U/Ou0jaefIItGRTsENY+7sebpZoQeeo6x0/BYE2rPFPw5Nle4u7QYw5WIIFG2U1p
+Ijti2WHSAt3jgWc0pw1LiCMPpmJ+BGQ//ceT3X1Fca4z4tNERcRbR4eJqjPuRV8
GQKsjPYP1kmaxDPtZpPoq9LCizS1dkITkFCl3PlFbEIJt1tF6nOn0XaYSd43LCBZ
zP82oKrtnWFH0+mob1WgZ5zIs5Z5Azhua4Ad7+SVl0m0tGQEncH2u0xV3yGd2yJl
KUiJZY0CWad3b32pKSPhZY7hHzXN26XsnCQH7YqhWoKdR5b6d4Z9zcBTUpK1uezY
0PCUNKzTTvMJHsJR2lMeoNNSNu6sCCEz8CPj+2FPHZXvALC/354=
=L+Q9
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
