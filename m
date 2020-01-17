Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E09EF14105D
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 19:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgAQSBm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 13:01:42 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51835 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgAQSBm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jan 2020 13:01:42 -0500
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1isVwC-0004m4-0y
        for linux-rtc@vger.kernel.org; Fri, 17 Jan 2020 18:01:40 +0000
Received: by mail-wr1-f72.google.com with SMTP id h30so10791078wrh.5
        for <linux-rtc@vger.kernel.org>; Fri, 17 Jan 2020 10:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jT7EnNA8LYNwRcfXtRBNzYywZ2t/ehJhGCP7DNw7s4Y=;
        b=HvSJdhrvg4FLE5jvA/5OIV2MfWwf4Vm7RndlvnG3d1AIWMvppmb1PCMawY9b/5mTX2
         u7/UniiWYECW/NZ7pctNOoFA/GW89+9gXrlKZNElacBxBSci1hoM7Q1xUaXp4NulORgB
         3FipF33kplJdf8oGZm1mWZVQD0v0PwMepxV5UiqdgwfgvrYMGE9usMS1sziHLKY3L6zJ
         jUPG/uOSRceWWvX1wuVIEH5AfRdW7LNFjsylsgbWNzHQ0TK56gYFrs8Tss3D4+7UVuwx
         p6fmscwmqOpFTx3HaPgxQJtrhwUoIFxwp5jlX5okvxTQaRhCjbSmxRX42z3qyC0TGbAo
         wYOA==
X-Gm-Message-State: APjAAAXVyEOopJIMzdZMx+x7eDiHvYURkFs7kdYrPNqWMtx+Uf1mwyjs
        Kb7f4aByaDhW9iF9xn6KOOwLbcaGNvo4pjJ3LjMRJXtYfYe2MV6HNL7hn/5cvsJfFy+HUtw87Ww
        p8ovz6xmqK2xpkWrjR1F4fZUZ7BSOKWQ1uF7lYqTeJtCfijfOQ2QmMg==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr5904361wmg.110.1579284099800;
        Fri, 17 Jan 2020 10:01:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRabNepEbi+j8KIgM4aBVYLaEgu9NUw+UT4/+4R0e3hsrX48PRqbrhhL0M5lfsfK6VIchvlPd0iC+zXWUBVmM=
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr5904348wmg.110.1579284099639;
 Fri, 17 Jan 2020 10:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20200103140240.6507-1-gpiccoli@canonical.com> <20200108174111.GD32742@smile.fi.intel.com>
 <87h815ybxo.fsf@nanos.tec.linutronix.de> <4882eca9-c5dd-a37c-bc13-14108300fd92@canonical.com>
 <9b04b099-0495-d188-7002-cad1147b61d0@canonical.com> <20200117144220.GU32742@smile.fi.intel.com>
 <CAHD1Q_y+9fK_CcmE7VF1XrATQA-Ru9O9=9XyGNvzxwu=Z-q9yQ@mail.gmail.com> <20200117175756.GV32742@smile.fi.intel.com>
In-Reply-To: <20200117175756.GV32742@smile.fi.intel.com>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Fri, 17 Jan 2020 15:01:03 -0300
Message-ID: <CAHD1Q_zceQ-cm3kcoZLrwn6k-apW2=q_uQEZNnKM4Nhn0-HEGw@mail.gmail.com>
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using
 HPET-based IRQ handler
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 17, 2020 at 2:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> I have just sent a series where first patch made to be fix and the rest is
> some clean ups.
>
> It would be nice if you can test first patch and series as a whole and
> give your Tested-by tags.

Sure Andy, thanks for the series! I'll give it a try next week and let you know.
Cheers,


Guilherme
