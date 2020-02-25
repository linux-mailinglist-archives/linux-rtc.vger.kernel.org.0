Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08BC516F14D
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2020 22:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgBYVnD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Feb 2020 16:43:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37870 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgBYVnD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Feb 2020 16:43:03 -0500
Received: by mail-wm1-f65.google.com with SMTP id a141so40578wme.2
        for <linux-rtc@vger.kernel.org>; Tue, 25 Feb 2020 13:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kEVJ1n2NxQ1glfbZ9e15foebWC3MxMe0p/5A/jyD6H0=;
        b=oveJUVfN4mGmIby/KrplpWvi32NOCpmb1Fej6u+eU25j1sso9bxSCmnS1HYlP5k+TS
         MN55kLyOOXTrI5QiCGtP00bRnkJxE6q+aUpqdFsAsXwQh0dvu55FS/TXrAVS/ae6mu1l
         NAlvopKlSspPGtPCVj0mdTNuFv+ZfhgIinLqRNatsNKvQI8KxR0B1VAiDYp321L4gtUZ
         g8u+mkFIDr2NdhUV2f4JbQ3BTA7fhSsIoCINRAOSYNlefs7F0PuxzSG5YkiVtBklT+fO
         oaD/MUhWA0PqDh9MWO9s+RAgppI/P3ICunuQwVb2PDrJVH31q6jq8+vTKG+aECdrMlUL
         Kc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kEVJ1n2NxQ1glfbZ9e15foebWC3MxMe0p/5A/jyD6H0=;
        b=hClnNFPVcHqT5URMZlJrwjBBD7cOfxwU9BUBbrXCegIHwFOUSKCzt2WvV3PFzoWJIH
         3/tNT5tHb7XRC/4Pb0HN3BSjtp+QmywFun7WG3dILMMpnpUzvYRdMp43MqEDdwGBI453
         yzYBjE3I/kC3Cg+qCihbI0SyLz4FROTpQQt7H44IHeTeLumu/rbl4oAY6eW2UACxeShe
         +w/0TF5HtPlCnQnZuEQER+ikKvFpQnCkvLbtNuOmy//VffPIFRzcYKC47c46Loo7D8wx
         RCVpA+HSwIdd9qTMhEdAPRAtTz5ZYuKYrIvxRPtxMwcCO4es6DrQSnUOJCFqSgQU1VOS
         1KoQ==
X-Gm-Message-State: APjAAAVYBkNZOHlhrNEM9KtxG746cac56nMTyB12uvhYZ97JLqv8pe3J
        HEsjx+8HlVsW8btr/8KSd97tsLt0VLFYWg==
X-Google-Smtp-Source: APXvYqzT6vU3uivqK3LFISSNim+ES8rBV5I3PSPpMQoyPtAT6binkjIz4QcxUjjxxm7ATqtLrWgIdA==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr1188559wmc.52.1582666980570;
        Tue, 25 Feb 2020 13:43:00 -0800 (PST)
Received: from ?IPv6:2001:1715:4e22:c580:ed96:156f:9663:e7e4? ([2001:1715:4e22:c580:ed96:156f:9663:e7e4])
        by smtp.gmail.com with ESMTPSA id f1sm212602wro.85.2020.02.25.13.42.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Feb 2020 13:43:00 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [RFC 00/25] arm64: realtek: Add Xnano X5 and implement
 TM1628/FD628/AiP1618 LED controllers
From:   Ezra Buehler <ezra@easyb.ch>
In-Reply-To: <04e7d7cd-a8bc-621b-9205-1a058521cabe@arm.com>
Date:   Tue, 25 Feb 2020 22:42:57 +0100
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        csd@princeton.com.tw, devicetree@vger.kernel.org, sales@fdhisi.com,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, zypeng@titanmec.com,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>,
        linux-rockchip@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E33E27B9-D33C-4182-A5B1-C72FA40470BC@easyb.ch>
References: <20191212033952.5967-1-afaerber@suse.de>
 <7110806f-ddbd-f055-e107-7a1f7e223102@arm.com>
 <c86c6bc0-b0e5-c46e-da87-9d910b95f9f3@suse.de>
 <04e7d7cd-a8bc-621b-9205-1a058521cabe@arm.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Robin,
Hi Andreas,

> On 13 Dec 2019, at 15:07, Robin Murphy <robin.murphy@arm.com> wrote:
>=20
> I also have one of the H96 Max boxes (which I picked up out of =
curiosity
> for the mysterious RK3318) with an FD6551, although I've not attacked
> that one with the logic analyser yet to see how similar it is.

I have a T9 (RK3328) TV box with the same chip in it. The FD6551 uses an
I2C-like protocol. Every digit (and the symbols) have an I2C address,
but, the display does not signal ACK. AFAIK the FD650 and FD655 which
are used in other boxes (Amlogic) are very similar.

So far, I have whipped up a proof-of-cocept driver that uses i2c-gpio.
The digits seem to be rotated by 180 degrees. So, in order to use
map_to_7segment.h I had to define the BIT_SEG7_* constants differently.
My display also has multiple symbols (WIFI, network, pause, play, USB,
alarm) that are controlled by writing to the same address as for the
colon.

I=E2=80=99d love to work on a driver (similar to Andreas=E2=80=99 SPI =
based driver) for
these I2C connected chips.

Cheers,
Ezra.

