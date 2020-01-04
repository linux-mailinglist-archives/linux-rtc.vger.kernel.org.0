Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB662130256
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jan 2020 13:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgADMXV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Jan 2020 07:23:21 -0500
Received: from mail-il1-f177.google.com ([209.85.166.177]:44442 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgADMXU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Jan 2020 07:23:20 -0500
Received: by mail-il1-f177.google.com with SMTP id z12so2292751iln.11;
        Sat, 04 Jan 2020 04:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKQLDuUQyKEp3PqqNw3i4af+LyZvLM7Wyx7d36N1/7g=;
        b=vAB0O4s6yBazbpmIEiJWWx9AHn68/D7fHgaqYwW8qVN6GEYn3Jd5FTODWftDaqvoWb
         o0aR4RUJuL8WgEYjmE59nhe1op+jIQ0w3FEU8F2Bi0d9e604m0gXTi4CX4zqkFy5ESIE
         a2/qY0xyBIhm3xiuremTqrk83EOHEEEnchWuG7ptss2XGcjOjGay+2Sv+5wQLTbIx8yS
         R2G7Z3Iwgsi2X50VkDj0E/nti4kMIRlzm1pGnx63us7gEwBE21oQhbjm0TqZ0z+erHs5
         GLPxLYuLwVAzytAc5/aPAGggMgctbiurMUgkkfO2ZZmympTiR4XIrAf0sYhiPEX9gH79
         usLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKQLDuUQyKEp3PqqNw3i4af+LyZvLM7Wyx7d36N1/7g=;
        b=B240iv7WmWACD5yryV5Zfdep0qAXt7CEZrqq/hN8zAIr2UD9YoKMwlnilsOilS2GDX
         c2eByEyrIBuHZDVXDF2xtTIWPGTHT1rrsKalZKOfhKH4XCrUJmnbWLraDztComNXLrbu
         uKX8CZONYj7PoQ5TMxJvJLnpiD33aLsiTWQyVCDPDiQz5IkNxPP28dt+P5sfUXjDj7Ho
         anabQkZlLtiL7j4jcIZptaeaqWAm5nI9DPjk6Ar1AmgbthxaQjV6bVEfgq+8i97uwGcd
         ukP0gj2eU8xjzNkjnK+VMZmkh7xtHbdSVs/D92Wg/WTih4YlsMyeAxj32jkiaNPHGVsh
         pALA==
X-Gm-Message-State: APjAAAV57W51veMPDzYYaISUebeXMP+QtJ2tayzUM8TaK618bGftDqHI
        cElf1++QeGuWfHm3KMqX0NGsdbdXuLrhwdmbLzRVLH0/5g8aRP0w
X-Google-Smtp-Source: APXvYqxRGib/GBLbSGJvISDQygameAmB0qxfxm7Vznd0dHfFks8EvS8cx3KiThhlephAoOkZaLJzrXSeJ044Qstyhy0=
X-Received: by 2002:a92:cc42:: with SMTP id t2mr79004310ilq.111.1578140599825;
 Sat, 04 Jan 2020 04:23:19 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10> <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10> <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
 <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz> <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
 <20200103100232.GH3040@piout.net> <CABXGCsNv7G94TxaaKX8KXL5DEJiFgNcSu4+WShE_kQjVSa7zZA@mail.gmail.com>
 <20200103101935.GI3040@piout.net> <CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com>
 <7c015680-01b7-9c3e-c4c7-5d0b6e964781@hygon.cn> <CABXGCsNpS+nCMZ9C89UQVEu_u+hJVtdxCvdnj2QNqQf-j7+DrA@mail.gmail.com>
 <6ac1d65c-33ac-e3a4-799f-24279b677f90@hygon.cn>
In-Reply-To: <6ac1d65c-33ac-e3a4-799f-24279b677f90@hygon.cn>
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Sat, 4 Jan 2020 17:23:09 +0500
Message-ID: <CABXGCsO25iq2tZMis3E-DF2ADz2Je45YfL11cgjFhmr+bz-6jg@mail.gmail.com>
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right time
To:     Jinke Fan <fanjinke@hygon.cn>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        J William Piggott <elseifthen@gmx.com>,
        Karel Zak <kzak@redhat.com>,
        "util-linux@vger.kernel.org" <util-linux@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 4 Jan 2020 at 16:37, Jinke Fan <fanjinke@hygon.cn> wrote:
>
> Hi Mike:
> Yes, We do check the time in BIOS Menu after first reboot.
>
> We do some further tests in our X570 platform:
> * "AMD Ryzen 7 3700X" with mainboard "ASUS ROG STRIX X570-E GAMING".
> * OS is Fedora rawhide, with default Kernel version which is shown as
> follows:
> $uname -a
> Linux bogon 5.5.0-0.rc4.git0.1.fc32.x86_64 #1 SMP Mon Dec 30 06:32:36
> UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
>
> And we upgrade/downgrade BIOS version from 1005/1201/1404/1405, and we
> found out that :
> * OLD BIOS version 1005/1201 does not reset the rtc time and keep the
> setup rtc time after reboot.
> * NEW BIOS version 1404/1405 DO reset the rtc time to 2019/01/01 after
> reboot.
>
> Detailed pictures of the BIOS time after reboot is shown in [2],
>
> We suspect the BIOS 1201->1404 upgrade might cause this issue.
>  From x570 BIOS changelog, we found that the big difference between
> 1201/1404 is the AMD AM4 PI upgrade from AGESA 1.0.0.3ABBA to AM4 combo
> PI 1.0.0.4 patch B,

The changelog for my BIOS are the same [1]. Unfortunately, I will not
able downgrade to BIOS of 0404 ver for checking assumption because
changelog description of ver 1404 contains warning "* You will not be
able to downgrade your BIOS after updating to this BIOS version"

> If possible, please tell us about the BIOS version and your hardware
> platform, which can be get from BIOS UI or using "dmidecode"
> in Linux env.

The version of my BIOS is the latest. It is 1405 for my motherboard.
Here is "dmidecode" paste: https://pastebin.com/akBPAvZJ

[1] https://www.asus.com/Motherboards/ROG-Strix-X570-I-Gaming/HelpDesk_BIOS/

--
Best Regards,
Mike Gavrilov.
