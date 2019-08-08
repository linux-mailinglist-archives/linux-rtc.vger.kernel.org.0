Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F280859FD
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Aug 2019 07:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbfHHFtM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 8 Aug 2019 01:49:12 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:47090 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbfHHFtM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Aug 2019 01:49:12 -0400
Received: by mail-ed1-f67.google.com with SMTP id z51so1691724edz.13;
        Wed, 07 Aug 2019 22:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hJnMSCAXvPmR1BZ+8zibfYrH0y/pT73eVvDwjd3Lsw8=;
        b=k5o7R1WqxUKFT2Gpl32b2tEoxh18GEKtcRxfBXs+QQzaclP8d868GeOHKZdNmUIj8Y
         hlzVDNUXj7ZUkntTioJPK1ikYAW8YJKkGZmmcGgrrowKAFRw2W/vOFwInHRdI03I9tdn
         wqR2hUDALp8ykyI1cwIEE9iTzvndfcJesqwkZ+E4E99/y/d4orLyh3DBZMjiwO/y/Rv7
         xuEqPxx/L+tMX0V5n3OC+VcYkuFCJofqtdVwhUAsQQ9GqJnXoXd7EGrvSgkxnLcSgZxU
         k6xmwxOqZXgmK1zDAHli571qVrLkNGsdLVr6Ayo5svDhTbLPu7h1CuX7jY8AE9tnpi5u
         C5og==
X-Gm-Message-State: APjAAAXh0JnT5IDlhqbupmw+zqH5YraES+14Bo68Bahh8oCHDKkE88Ll
        cCx9eGyFliFl5TjhPcs3t2VdNzAO/00=
X-Google-Smtp-Source: APXvYqxg9vJ4l1QRSKAQTdjsRPjbtcm9XCJ1t7YXpJhG1HoGUipLszFyE3bzb67r8G/bMglEGxNbsw==
X-Received: by 2002:a17:906:4ed8:: with SMTP id i24mr11500568ejv.118.1565243349525;
        Wed, 07 Aug 2019 22:49:09 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id b30sm21935944ede.88.2019.08.07.22.49.08
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 22:49:09 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 10so1079305wmp.3;
        Wed, 07 Aug 2019 22:49:08 -0700 (PDT)
X-Received: by 2002:a05:600c:292:: with SMTP id 18mr1427274wmk.51.1565243348647;
 Wed, 07 Aug 2019 22:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190412120730.473-1-megous@megous.com> <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home> <20190807105502.GK3600@piout.net>
In-Reply-To: <20190807105502.GK3600@piout.net>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 8 Aug 2019 13:48:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64y+iUknG=h6NC_16JsiBXATim4PpX6g3OVg3G0vDjBwA@mail.gmail.com>
Message-ID: <CAGb2v64y+iUknG=h6NC_16JsiBXATim4PpX6g3OVg3G0vDjBwA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree <devicetree@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Aug 7, 2019 at 6:55 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 06/08/2019 20:30:45+0200, Ondřej Jirman wrote:
> > Maybe whether XO or DCXO is used also matters if you want to do some fine
> > tunning of DCXO (control register has pletny of options), but that's probably
> > better done in u-boot. And there's still no need to read HOSC source from DT.
> > The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_SEL is 1,
> > it can do it's DCXO tunning, or whatever. But neither OS nor bootloader will
> > be using this info to gate/disable the osciallator.
> >
>
> It is actually useful to be able to tweak the crystal tuning at
> runtime to be able to reduce clock drift and compare with a reliable
> source (e.g. NTP).
> I'm curious, what kind of options does this RTC have?

It has options to set the current, trim cap value, band gap voltage, and also
change the mode to just accept an external clock signal, instead of driving
a crystal. The settings for the former parameters are not explained though.

See page 364 of
http://linux-sunxi.org/File:Allwinner_H6_V200_User_Manual_V1.1.pdf

ChenYu
