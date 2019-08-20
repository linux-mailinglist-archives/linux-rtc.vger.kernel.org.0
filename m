Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146239689F
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Aug 2019 20:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730092AbfHTSd2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Aug 2019 14:33:28 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:46539 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730006AbfHTSd2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Aug 2019 14:33:28 -0400
Received: by mail-oi1-f176.google.com with SMTP id t24so4864492oij.13;
        Tue, 20 Aug 2019 11:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqYFWFK/ADw0LWhiUiVtqIu4MsMiNN1qpQeUvKdTaHc=;
        b=H/2HKzsl85NFkv/EJOLn7i5cOVzNjyBl1CX3elN8kJkS1ociXgufl3S6tRiP5tOC6V
         Nc9NI05xq9fHOsqo+KYK1zLw/+OHPelRI0wnKQgTaUnv6mKcD+Ic4+KaVfrVuAwFXdRs
         6Ny8mYV3BThdOHrQgnhbvFRPR/2vVbioHGz9kuBKDynLlfrYn4mh8kCDDqMPWVI2xzE3
         1i02e7bfaoLHOsxpDNtFG/u8N/yP297jUuqYBvPDWySayJ9davQTE11GRge0zZxoN7mb
         gIi0pp4U0Q4Dwog3/bzC2Rby/Lpn9q4LPoGqfa0xrck63MumfeaV//8QqSH2TigoCXJ+
         o5iw==
X-Gm-Message-State: APjAAAXfcDSuaQ4bOusptzuE1tjmfyvvR/MHm7PsvJZMP1+TMWLCH4sE
        6vut8lgT0N2zxanumCySjanm9K42
X-Google-Smtp-Source: APXvYqwm9Hh7OHLnDBOOtI79AYPhRYpLT3NXznfnLzS2qAO+k4kwhr+6ichqonvTamqD2Kk1BBLyuQ==
X-Received: by 2002:a54:441a:: with SMTP id k26mr1020271oiw.78.1566326006743;
        Tue, 20 Aug 2019 11:33:26 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id h25sm4180532oih.22.2019.08.20.11.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2019 11:33:26 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id r20so5966940ota.5;
        Tue, 20 Aug 2019 11:33:25 -0700 (PDT)
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr812157otq.221.1566326005853;
 Tue, 20 Aug 2019 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190816024636.34738-1-biwen.li@nxp.com> <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net> <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <20190820182224.GI4738@sirena.co.uk>
In-Reply-To: <20190820182224.GI4738@sirena.co.uk>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Tue, 20 Aug 2019 13:33:14 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ__XRW74e+Dq0BEjJq-onVi2dmb7qKrn2Lt_xr50VCCw@mail.gmail.com>
Message-ID: <CADRPPNQ__XRW74e+Dq0BEjJq-onVi2dmb7qKrn2Lt_xr50VCCw@mail.gmail.com>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
To:     Mark Brown <broonie@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        nandor.han@vaisala.com, Biwen Li <biwen.li@nxp.com>,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Aug 20, 2019 at 1:24 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Aug 16, 2019 at 02:40:47PM -0500, Li Yang wrote:
> > On Fri, Aug 16, 2019 at 11:30 AM Alexandre Belloni
>
> > > Most of the i2c RTCs do address wrapping which is sometimes the only way
> > > to properly set the time.
>
> > Adding Mark and Nandor to the loop.
>
> Is there a specific question or something here?

Some of the RTC hardware has the capability of address wrapping which
means if you access a continuous address range across a certain
boundary(could be the boundary of a regmap region) the hardware
actually wrap the access to a lower address.  But the address
violation check of regmap rejects such access.  According to
Alexcandre, the address wrapping is essential to the functionality of
some RTC devices and can improve performance for some others.  We are
wondering if it is reasonable to have regmap support this address
wrapping.

Regards,
Leo
