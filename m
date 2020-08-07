Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB50023E86C
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Aug 2020 09:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgHGH6u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 7 Aug 2020 03:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgHGH6t (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 7 Aug 2020 03:58:49 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E41C061574;
        Fri,  7 Aug 2020 00:58:49 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id q4so600419edv.13;
        Fri, 07 Aug 2020 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tuw+x57Z+bMcMrxr13BmFplTP3eisVN9XVgbyO55MO0=;
        b=vRMd9PUlAg/a5xmdWCCfudW7SwJ5VR6Z4Hrhm4qR8AOim0VagQlEEad1/0Bx+dWJHZ
         sW5AyqOC3WpW1oKnKWCgq26dn48KoTG5VOMdvrRDz+XxkjoXzY46+8QfSMdLjMl2UFUN
         hNiurKamXzapq24Q1kcLZ+3SyqbMz1OCkqFVPcEWMPombjDFWV1KQMhtJ+8seNLFy4XA
         B6QaHrsOXOQdO/d56eSbYpJMAHxQsEFWpmmG5rW9Jf4jp7v/Z3n8aqf3WlMWkg7ccsTl
         3diRQ+8LV/AkVjq7i5wLxkcRDbE/z8ASxSTKY6+F/kktXByiHb8HkEheKRUsQXBICc3y
         m2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tuw+x57Z+bMcMrxr13BmFplTP3eisVN9XVgbyO55MO0=;
        b=OYiMzjFXPSFO5Hq00tRgxUUXGI1KnzFjieli2VyU1XNqwg45ScewNUV3x+tPgHcIiT
         yR5Y7tdieRxpRRetn5YsaiJcP+y61x0w/grb3RNufqeSp8HtTOY/KhOH4+Ba1f43822r
         YW52K8CYLrgckhEAIWTuLP7vWmyyQ/cS1y+YMuJe6hWPp5hqZI/0DBXbuG220YiNHPKU
         leGOsjjIVXC6lr0NAInuUKbJCd15Iwq7AYE9A/fdYD9gMuSOKFNoGd3D+S2BXQYXGEOc
         NCQxdQOAQnYi6BJIiZebeZvbObydySGHkPffutf5uj3g/yIBdXvJhzDAwQUThoaRObAU
         3C0w==
X-Gm-Message-State: AOAM531D0HiAnLXtvB4dOR3F0rC6opHg60kMgTeKyCSKhdyV7BICtMIK
        RqiNXpwIrcoXynwKKBU0Mtw=
X-Google-Smtp-Source: ABdhPJyiAQdzHoP6LkrlU4ivnx0fWRZ4nd2LXvjjg5R081k//p8Tggu2WF2t2e97x3dZ+ksitMw9xA==
X-Received: by 2002:aa7:dc44:: with SMTP id g4mr7788605edu.273.1596787127998;
        Fri, 07 Aug 2020 00:58:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t19sm5020290edw.63.2020.08.07.00.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:58:46 -0700 (PDT)
Date:   Fri, 7 Aug 2020 09:58:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] rtc: max77686: Fix wake-ups for max77620
Message-ID: <20200807075845.GA94549@ulmo>
References: <20200806125431.699339-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20200806125431.699339-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 01:54:31PM +0100, Jon Hunter wrote:
> Following commit d8f090dbeafd ("rtc: max77686: Do not allow interrupt to
> fire before system resume"), RTC wake-ups stopped working on Jetson TX2
> and Jetson Xavier platforms. The Jetson TX2 uses the max77620 PMIC and
> the Jetson Xavier uses max20024 PMIC. Both of these PMICs have the same
> max77620 RTC controller.
>=20
> For the max77620 RTC, the variable 'rtc_irq_from_platform' is defined as
> true in the max77686 driver and because of this the IRQ passed to the
> max77686 driver for RTC is the PMIC IRQ and not the parent. Hence,
> following commit d8f090dbeafd ("rtc: max77686: Do not allow interrupt to
> fire before system resume"), for the max77620 the RTC IRQ within the
> PMIC is now getting disabled on entry to suspend and unable to wake the
> system up. Fix this by only disabling interrupts on entry to suspend
> in the max77686 RTC driver, if the interrupt is the parent interrupt.
>=20
> Fixes: d8f090dbeafd ("rtc: max77686: Do not allow interrupt to fire befor=
e system resume")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/rtc/rtc-max77686.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Looks good and fixes suspend/resume with rtcwake for me on Jetson TX2
and Jetson AGX Xavier:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8tCbIACgkQ3SOs138+
s6FF4RAAs2d+/2YZ7DDSBgsjCUYQQRTj7u1jgGgJyk27ZbXjEXyk+H3qYtN4efBS
EDtAOnfvYOcliYvh5dmGqsGUSTAhE2jBHcfVJxv6V5lrB5svQSJqOz0I1jPl6+Gk
yy5KenGE69Iqyp0G/GjiRtvlbHHhvIJXn0DrwIwAay8DkWz7KDSso/x6VngDSCkk
SEbBddoYJaUEC1SRmgZ3YmKJD5SypxsmcOy6RxBnxG3UnZQ0nP9oRU0UVfVzi9Fe
5tbr4kD/6L9iMjzkGnz/oAWYTHQJzdpI2p5YKO3gR9+U9CVpX9lHVI75O0oUfnSa
h4Je+sf9OkAggfoNZz6NTEhydtWkDsukl3veSzXAdTqEam3xTTdKTo4gTPhC+TXF
p7uWJtzRhPq4v150lOTqVOWWKVsXCr8Jq67HwpHFjsYrhcoKfm7YhJ4EgxlPyR7T
k0cOMM5c0PJSoO8lgg8kIAIbd+1GXeUjH/rRxQJiOilSmgV5Ta95xcGQQExW64V+
QJt4ee0w2sRy6n305M+i6ERNntwbWppFhs6FdhUsmvCNj8reNm6QMHdevS0zIwrM
btvPfP2Wyv28JAmHRgIFg/J2CrpWrMNYH7MkBo+N3VXwgESL71rzUZDjH95RqtbQ
Q6FCRVnAG7xUE+PtaZVQlEKArHR5AzUI4ELCdxf1gHrMcZI0PTk=
=iem5
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
