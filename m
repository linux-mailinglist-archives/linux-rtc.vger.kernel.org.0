Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 326F8125C9D
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Dec 2019 09:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLSI24 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Dec 2019 03:28:56 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46453 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfLSI2z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Dec 2019 03:28:55 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so3671408lfl.13
        for <linux-rtc@vger.kernel.org>; Thu, 19 Dec 2019 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EYVpTAvfKwHHKmlAPuGRsZ3iezpd785NjyR9OVcUj6E=;
        b=MJZ/DNtFXAxxKUZKDxH+hao28YTyE5NOXtuQ0Z3/ibWy8zpn9idcT5fZSA3qlJswY1
         Yijm5VvGd/xFqGL1v6NZGRxBXBKHV016m5JvvGWQlY0M4LINXT2A+VMv/c7K+z0FglYN
         FkcONe7Byj4YXGeofGkBJBC9L9BYhWz0U/7T5uj+m7cWbGsUIxhMxvZYjxq9RmDbTAeo
         5FOeLkOvfmFeFbQ9FneVOLbyy+1qTeqa2lenupHqbbfkraaI8ywbs0EUp3VJNPMnGg4z
         8lysTRj1vQ/4vBUWcuSX068OiI8cXcTJLEVHZYJzOCkkKrvNMEEtnJ4J5TdoqJk3xzfJ
         RFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EYVpTAvfKwHHKmlAPuGRsZ3iezpd785NjyR9OVcUj6E=;
        b=WglS5sm/louRj2a8IoEdQGu/Zfb28TupZI/essspbbMKkiVQEgKIs1z5Zj56EwygGT
         wBfkb6g2qKmYHpD0PuL2F7d4uicm6YXDkjkDfCpZFjNtHINp4DMNFiYLRfIzId21O6Dr
         xaIjkjs0mcSgLD7vfBNqzeZN+fveKfTWPy751WvoB/ZAMfeiuyJ0LzaCFTmbI8nGq2v1
         q2LTkzc38ogx0Fu9eK9ERgFsqBVVwvW2yB8Dt+SeKS6HA0Q9p46ZY3llnf2T7wGM5664
         e9VBeEgKPN+03/uztJsmJaG9Am7e2Z+xPEDuk5yJmlElgy5pTEEoU4qqJYL1uGGan0sd
         NROA==
X-Gm-Message-State: APjAAAWTAHuTw9FoNAxDxjZzP3SZ6neyP4FR4fPdNvQ+MxaNtDnwnPSm
        Dos4/8aJHa8OGEnxK2c6VUm8mQlsY3f1bN0JsyWF0A==
X-Google-Smtp-Source: APXvYqynTJm9GoZtkT/ox5Ee2KtmtUCBm2Ol3fEci7a1RBI4FjyF3QqGMde1dsSwXQ7lWCCv/YG69H6YPlbklmRCDWQ=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr4543898lfd.5.1576744133697;
 Thu, 19 Dec 2019 00:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20191213124221.25775-1-tbogendoerfer@suse.de> <20191213124221.25775-3-tbogendoerfer@suse.de>
In-Reply-To: <20191213124221.25775-3-tbogendoerfer@suse.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Dec 2019 09:28:42 +0100
Message-ID: <CACRpkdY+2Z90n6zNZbQpmGCWYAH4PzEOv8puOkwbrcxCk_Eq2A@mail.gmail.com>
Subject: Re: [PATCH v11 net-next 2/2] mfd: ioc3: Add driver for SGI IOC3 chip
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, linux-rtc@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 13, 2019 at 1:43 PM Thomas Bogendoerfer
<tbogendoerfer@suse.de> wrote:

> SGI IOC3 chip has integrated ethernet, keyboard and mouse interface.
> It also supports connecting a SuperIO chip for serial and parallel
> interfaces. IOC3 is used inside various SGI systemboards and add-on
> cards with different equipped external interfaces.
>
> Support for ethernet and serial interfaces were implemented inside
> the network driver. This patchset moves out the not network related
> parts to a new MFD driver, which takes care of card detection,
> setup of platform devices and interrupt distribution for the subdevices.
>
> Serial portion: Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
>
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>

This makes the kernel a better place:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Will there be a GPIO driver arriving later?

Yours,
Linus Walleij
