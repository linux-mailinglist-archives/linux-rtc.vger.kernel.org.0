Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A269BC77
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 10:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfHXIE3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 04:04:29 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39636 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfHXIE3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Aug 2019 04:04:29 -0400
Received: by mail-wm1-f68.google.com with SMTP id i63so11147872wmg.4;
        Sat, 24 Aug 2019 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VWTrrD9BiZwTcjf+bsz7w5cdA1f2skqCvm3ZXEVoQko=;
        b=rLFe9GDUmcKFAgh3siKa6rcZjV6ZTqAECcU7vFmKs+8luJPS6lPf/30lo87A+v/YdA
         k0eEahzlS4MN2UyQZwkJBEXNHSMpQeprmvFCm83j8540sng/XeMTj0zGAEVL3SxFUXMT
         XsEjYrGfUCeeoSPLXrVghHN5ADPy0t6FkPL/RGpXJSr1V6LrhBWeYtVVDVaa+p0gj+Nq
         vXCEarwIW3Z1tJQqFoSHwR2HjJcUUpIj4Q1K0XZ+Q/nV838if8H0+ILcmrYPrqyR/75q
         xB0KQhROV0WLleteEgaruKAin4MdIgqdyxAkARwLvdg7uViPhF9sW6GdV9Tx0fMhfySL
         SIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWTrrD9BiZwTcjf+bsz7w5cdA1f2skqCvm3ZXEVoQko=;
        b=Vf7uIFtupt8ZbDAC2MCpOl8lGX+zGYbe5gbRY8ORCTnSKEyzBSfxAYBNkVxQV2VItc
         X/FguT9d04mcbQ/jS4BwnAxUitJgba1KBsf1CQl3r/NDez60ckPoEPUrD5j507LGCNeb
         SNcghKuBrIgQlnJdiRgh8Xk65gLKLIOzwWfg5iapAJwvaNacaH598ySNbv+WV+yufpVZ
         ejyQWR9wr427o8rThUxmYIAvmibT6lR7pjyWivPTGPAEZSCDz2cDxPNuY5XMyHBZ0h2A
         evTt0IbZd2Pk3RIIf9mh1vrZdBVJQ3PLsr8ApwC/vF6IJ+Xb7a7lSXwjRBfAuwzOjiKE
         OvBQ==
X-Gm-Message-State: APjAAAWvbXBRoOmYWDdvxucyxToVf0osdCEoaIbiszhOcMaLQr+/adRi
        xs13CwPPgMhmmDKBnZ08xUM=
X-Google-Smtp-Source: APXvYqzD0Dns5joa+Ot++jWHSQNsQH7+esIAVGFYLB7Fuk220hjiNVzXi3Tb84YV9R8dtQReMAQ8QA==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr9986010wml.175.1566633867494;
        Sat, 24 Aug 2019 01:04:27 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net. [86.58.59.25])
        by smtp.gmail.com with ESMTPSA id r11sm4727847wrt.84.2019.08.24.01.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 01:04:26 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-sunxi@googlegroups.com, megous@megous.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 0/3] Add basic support for RTC on Allwinner H6 SoC
Date:   Sat, 24 Aug 2019 10:04:24 +0200
Message-ID: <3686940.YHdMKP4MVq@jernej-laptop>
In-Reply-To: <20190820151934.3860-1-megous@megous.com>
References: <20190820151934.3860-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi!

Dne torek, 20. avgust 2019 ob 17:19:31 CEST je megous@megous.com napisal(a):
> From: Ondrej Jirman <megous@megous.com>
> 
> I went through the datasheets for H6 and H5, and compared the differences.
> RTCs are largely similar, but not entirely compatible. Incompatibilities
> are in details not yet implemented by the rtc driver though.
> 
> I also corrected the clock tree in H6 DTSI.
> 
> This patchset is necessary for implementing the WiFi/Bluetooth support
> on boards using H6 SoC.
> 
> There was some discussion previously of describing HOSC, DCXO and XO
> oscillators and clocks as part of RTC in DT, but I decided against it
> because it's not necessary, becuse information that would be provided
> as a part of DT can already be determined at runtime from RTC registers,
> so this woudn't add any value and would only introduce complications
> to the driver. See: https://patchwork.kernel.org/cover/10898083/
> 
> Please take a look.
> 
> 
> Thank you and regards,
>   Ondrej Jirman

Sorry for a bit late test, but with your patches on Tanix TX6 box I get this 
in dmesg:

[   17.431742] sun6i-rtc 7000000.rtc: Failed to set rtc time.
[   20.439742] sun6i-rtc 7000000.rtc: rtc is still busy.
[   21.435744] sun6i-rtc 7000000.rtc: rtc is still busy.
[   24.055741] sun6i-rtc 7000000.rtc: rtc is still busy.
[   24.439752] sun6i-rtc 7000000.rtc: rtc is still busy.

Last line is repeated non-stop.

Any idea what could be wrong?

Best regards,
Jernej



