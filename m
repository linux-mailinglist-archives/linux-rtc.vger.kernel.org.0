Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1863A10D73F
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 15:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfK2Opm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 09:45:42 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40186 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfK2Opm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 Nov 2019 09:45:42 -0500
Received: by mail-qk1-f193.google.com with SMTP id a137so23903835qkc.7
        for <linux-rtc@vger.kernel.org>; Fri, 29 Nov 2019 06:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=TWfKzcQl60jtCPLoRfmxjCctpkhz2BfZWwCKg7J3VrA=;
        b=mCKKemmaFzimC5ij3uzJg1fMLerJ5cahsNJSvbYfMaTXicD62h2Ath5igR7aGbYFb9
         zIqaEAZOn3d1c/otFgnZIysvQruBQzhsrEJjR2az6erTNRLODFbUrNcR12Vo5FgRezkn
         +lZHh5GszM4Htq3xAqCncIfe4MqTSDOD0tWuLseLhOU/zUxeylxCfBv4RH2Bm7/WnklB
         9HmWJUf0/d2ETEs6u15hX6N3XkDqt967qcWQVbM08f7FyemRwwABFtfglrjYjFssZXGG
         pF3x0re4LW5N35ai5AhN5AjQX4nmDDxbwkwFaVZ7CfUYN9ja/tNagLfK9W8CF8pzm79v
         nPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=TWfKzcQl60jtCPLoRfmxjCctpkhz2BfZWwCKg7J3VrA=;
        b=muLoN0JpsphF8sZk2FYfTCXrvut+NrNxQ4i7KU1DJ0YWtgAE9xC9Z3703bw1ZYJe5I
         kpE3EU1BOLMSyNV1F3kM2ef8K5qd03MmXKRBnmKxLnU3rPzQvU2+uCXa8L3TzsJbtP8p
         VO04ADmvsX8y9szW4x/aB17yCpkYviQxevMRo54+zumTOHLMt6MZ9svyg1w/hZRWvTpk
         DbYaiQygSebAjIJNnuwcgObR/SjIyx83PkVWM8xopPHTVCVuaJvo/H3iyYjoM2bLJ3KI
         T3WITwfiO7wiDJBD5T320QySEGNumzDFu/sLND9NIpaYp3tHvI/51LLKzNz7jf1GSCqK
         zx3w==
X-Gm-Message-State: APjAAAVNsYHdTw4IpFI4e4GTmcCiXzMWMnhELvtXHXPp+UDSQxCAtZ36
        nT7lJRJJ77OKjErr4kqpWLRCCTi/kUQS3g==
X-Google-Smtp-Source: APXvYqx9DDTat6ZAlZI+uCgwRQjQ7mwcOC/YsQuEVl+60H3Z3qEJxpzGoZ20Zb7QWND0yRwXSRNPTg==
X-Received: by 2002:a37:a9cd:: with SMTP id s196mr16455169qke.264.1575038741354;
        Fri, 29 Nov 2019 06:45:41 -0800 (PST)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id z3sm860366qts.50.2019.11.29.06.45.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 06:45:40 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 2/2] rtc: zynqmp: fix invalid read_time before 1 second
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20191128172957.GS299836@piout.net>
Date:   Fri, 29 Nov 2019 09:45:39 -0500
Cc:     Michal Simek <michal.simek@xilinx.com>, a.zummo@towertech.it,
        Srinivas Goud <sgoud@xilinx.com>, git@xilinx.com,
        linux-rtc@vger.kernel.org, champagne.guillaume.c@gmail.com,
        =?utf-8?Q?Maxime_Roussin-B=C3=A9langer?= 
        <maxime.roussinbelanger@gmail.com>,
        Mathieu Gallichand <Mathieu.Gallichand@sonatest.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C8E7EEC-A71D-48CE-8128-FACBD77EBD2E@gmail.com>
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
 <20191128015613.10003-2-jeff.dagenais@gmail.com>
 <ca78b7e6-a0c3-745b-1533-6b8424d97623@xilinx.com>
 <CD70064B-5087-4A0F-9197-1F4A3DAA8B50@gmail.com>
 <20191128172957.GS299836@piout.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Bonjour Alexandre!

> On Nov 28, 2019, at 12:29, Alexandre Belloni =
<alexandre.belloni@bootlin.com> wrote:
>=20
>> Then we enable the RTC:
>>=20
>> xsct% rwr rtc control 0x81000000
>>=20
>=20
> Doesn't that enable battery switchover instead of simply enabling the
> rtc, I though you didn't have a battery.

In our tests, psbatt present only means that the RTC preserves it's =
state and
registers when the platform is powered off. Before toggling bit 31, the =
counter
(current_time) doesn't move despite the platform being on (psbatt =
present or
not). This indicates that effectively, the bit turns on the RTC.

>=20
> Or does that mean that your previous read of control returning bit 24
> set is also bogus?

https://www.xilinx.com/html_docs/registers/ug1087/rtc___control.html#
Bits 30:28 are reserved, and not 0x0 as this reference page suggests, so =
who knows
what the bits mean... well someone at Xilinx knows!

>=20
> I ask because the simpler solution would simply to return -EINVAL in
> xlnx_rtc_read_time when you detect a power on condition.

That could also work, but how would we determine that? Oh, perhaps by =
looking at
the Battery_Enable (31) bit. But then we would need to keep it disabled =
during
probe so that the time_read could test the bit to see if current_time is =
valid,
and then after this, when would we enable it? Perhaps at the first call =
to
set_time_write? This is all interesting but for now we have run out of =
time to
investigate further. Unless someone comes up with a ready made =
alternative
solution, we here are actually going to go into production with our =
patch. It
works well.

Cheers!=
