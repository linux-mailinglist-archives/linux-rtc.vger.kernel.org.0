Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982FD9BC8D
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 10:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfHXIGT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 04:06:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35178 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfHXIGS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Aug 2019 04:06:18 -0400
Received: by mail-wr1-f68.google.com with SMTP id k2so10612717wrq.2;
        Sat, 24 Aug 2019 01:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=58C0QNHWQcW+nSLPaoT9CxsTMXwj511Ek3VVka0DlPQ=;
        b=B5xQXiqE3Vp6VFi1ZvNBuFiQAi/eIXbAfbMJ9wobxfvtytVEcrRqeuV0UUtwRSSTu5
         0Ckj2jYBxuaE068uoLwxXCXadKE42Derib6FCei5sN8jc7VSexC58Z0BNCINcTH2qXbv
         LjbSn0gR80dikZ8wYGfWw2pyVJJ37yVeBVYETIVce6JrYEVJDgzryp8H6Hfy7AKcgsFE
         oUHsXCpgHPlLr91Af7451ESymWNiPp49UDWelz+S3FZIB+r5Huh4SS0CO5RqJsxJG/KG
         dWrYqOhYMk/P5IC69W2P/kzVrOt6HjDzb8zjotZWg4xs3I2FALSlaK0FlzfjvW8HohV7
         d8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=58C0QNHWQcW+nSLPaoT9CxsTMXwj511Ek3VVka0DlPQ=;
        b=ZywfHN0fhoCrjBKKBXie2rx6403hYl0r0VD8ABJqW7gXf+D/4wODC7S3LG9stlNV2u
         OUpqcJmlxaqfNoEMIF+H9ZMhAztT2RAU1oEyilxvS0RJNs7Q62hVo5O7Deu1R6teSbRG
         cFowMya3J2sWK3RQD5HjtdW31bH2SjtV/6UDa/JF/dmazllG6I98M/eWTPw6xukpn42g
         225Gm8hx+mitYl0V/i9HMZLAhrXvE7WveEdazUKoLUqBfqyrHzwen3Bp732SZMeh8Snb
         djVfKUk2gIbv/RSl3WK513EXGGZoHIDoT5YEC6z3AggpUEbYesia18MBqa/LgGjpgTl3
         abHw==
X-Gm-Message-State: APjAAAXaPFMrRXkyxvAnL0vjqebrfNwV/I3Idt7kVrZ2e8rAzp/13nWY
        XM1c9PZU4oxvQveRzhUWqXM=
X-Google-Smtp-Source: APXvYqwOnxQ0AzVpFZ1HBm5/boRWlpN8TL03h6oGNkuhEZ2kZoZ1oBQcqfA7KzDP+OzLAkaQMfIu+Q==
X-Received: by 2002:a05:6000:104f:: with SMTP id c15mr9366925wrx.225.1566633976612;
        Sat, 24 Aug 2019 01:06:16 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net. [86.58.59.25])
        by smtp.gmail.com with ESMTPSA id n8sm4160105wro.89.2019.08.24.01.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 01:06:16 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-sunxi@googlegroups.com
Cc:     megous@megous.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 0/3] Add basic support for RTC on Allwinner H6 SoC
Date:   Sat, 24 Aug 2019 10:06:14 +0200
Message-ID: <5421621.t8Lore9UF7@jernej-laptop>
In-Reply-To: <3686940.YHdMKP4MVq@jernej-laptop>
References: <20190820151934.3860-1-megous@megous.com> <3686940.YHdMKP4MVq@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 10:04:24 CEST je Jernej =C5=A0krabec napisal=
(a):
> Hi!
>=20
> Dne torek, 20. avgust 2019 ob 17:19:31 CEST je megous@megous.com napisal(=
a):
> > From: Ondrej Jirman <megous@megous.com>
> >=20
> > I went through the datasheets for H6 and H5, and compared the differenc=
es.
> > RTCs are largely similar, but not entirely compatible. Incompatibilities
> > are in details not yet implemented by the rtc driver though.
> >=20
> > I also corrected the clock tree in H6 DTSI.
> >=20
> > This patchset is necessary for implementing the WiFi/Bluetooth support
> > on boards using H6 SoC.
> >=20
> > There was some discussion previously of describing HOSC, DCXO and XO
> > oscillators and clocks as part of RTC in DT, but I decided against it
> > because it's not necessary, becuse information that would be provided
> > as a part of DT can already be determined at runtime from RTC registers,
> > so this woudn't add any value and would only introduce complications
> > to the driver. See: https://patchwork.kernel.org/cover/10898083/
> >=20
> > Please take a look.
> >=20
> >=20
> > Thank you and regards,
> >=20
> >   Ondrej Jirman
>=20
> Sorry for a bit late test, but with your patches on Tanix TX6 box I get t=
his
> in dmesg:
>=20
> [   17.431742] sun6i-rtc 7000000.rtc: Failed to set rtc time.
> [   20.439742] sun6i-rtc 7000000.rtc: rtc is still busy.
> [   21.435744] sun6i-rtc 7000000.rtc: rtc is still busy.
> [   24.055741] sun6i-rtc 7000000.rtc: rtc is still busy.
> [   24.439752] sun6i-rtc 7000000.rtc: rtc is still busy.
>=20
> Last line is repeated non-stop.
>=20
> Any idea what could be wrong?

Additional info - this is on kernel 5.2.6 with your patches applied.
=20
Best regards,
Jernej




