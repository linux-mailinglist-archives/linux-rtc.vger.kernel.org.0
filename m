Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 935DD130163
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jan 2020 09:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgADIZf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Jan 2020 03:25:35 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:37051 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgADIZf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Jan 2020 03:25:35 -0500
Received: by mail-io1-f44.google.com with SMTP id k24so13330430ioc.4;
        Sat, 04 Jan 2020 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IITNyuhRvFPFRzEQHBam4oqBhV4UL3sQSXHfLhzuc28=;
        b=nawC8F4dkiL5w80TVV1YCRPySNjoCpsSggwJn3o6IQCNx5XzNk9Hpx/HVkJMEfo9pR
         wQgDX1ye9j/J9KWmupq0RLHu1F+vjNswaELjonmCMqjRRkjOaQzI2JdNj+nqDFY5cBpY
         nyoXMDX+yeGRSXp7yyMnIWH8iSYJSQ8g6Pi1LG/q5oS4vCWAPIudVcrnt1TWCQZGCfKg
         iog1j4o8Lqtw2bGQBU+8oRPn+qfy1lmWAhvJIzhjpC4eemXEqzAMrspLSS5QvvoLiNKj
         Avmk8S1K0/KngxOspnu0z6GbmiGZdrALd0y/S8o7HaddtmQWqtvp64JUOyljUKwp7OsA
         St4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IITNyuhRvFPFRzEQHBam4oqBhV4UL3sQSXHfLhzuc28=;
        b=kpYxsU7wlQw2Ht97O7DW5pITs852ozNaABcofcEZBcyoa64Olh5MY+xdPzinmXB3zr
         uWS7ix7jmmF4tYtPo3i/NThRchv4L7MYv/XWvmV76b4tWmwAfBav4zxwZWm1uYIOBKJd
         p17Vmto5Gzk4Mq4XOh+495aQOh9V9e5ZXiN8Jn4lyWrrPBiUTLitE87IKPVIZsj8sOA+
         PQU6tsRT+oYlO98eIxpoACV7diS9ZcYFhDGgvWfjiDW7BGgJ/sC+DHSVn+pvIbBUJ4B9
         IqVoNsyEIRGvTCXMGxkE2DWabrStrBIcsVB6svteyPYTIf9zT3fsgDgSMXe/xJnykrX4
         JKyg==
X-Gm-Message-State: APjAAAWmyNnzVwMaOfSIqF9PlNw3nvn2wQfxbzzzjGR/72RCJn+4HAch
        UI8yJZK+cQiMcNA2Irl2hWVMGoPzVKGjNQV4W6g=
X-Google-Smtp-Source: APXvYqyZhRcybOoIECFq8vx6FikF6Uav7qGPvLsgyLwzmeRicOnTtBZ+gjA/YUWXbUpG63B8a5eqq/nhfNs2s0Ffnbg=
X-Received: by 2002:a6b:8e51:: with SMTP id q78mr58267435iod.179.1578126334398;
 Sat, 04 Jan 2020 00:25:34 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10> <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10> <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
 <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz> <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
 <20200103100232.GH3040@piout.net> <CABXGCsNv7G94TxaaKX8KXL5DEJiFgNcSu4+WShE_kQjVSa7zZA@mail.gmail.com>
 <20200103101935.GI3040@piout.net> <CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com>
 <7c015680-01b7-9c3e-c4c7-5d0b6e964781@hygon.cn>
In-Reply-To: <7c015680-01b7-9c3e-c4c7-5d0b6e964781@hygon.cn>
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Sat, 4 Jan 2020 13:25:23 +0500
Message-ID: <CABXGCsNpS+nCMZ9C89UQVEu_u+hJVtdxCvdnj2QNqQf-j7+DrA@mail.gmail.com>
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right time
To:     Jinke Fan <fanjinke@hygon.cn>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        J William Piggott <elseifthen@gmx.com>,
        Karel Zak <kzak@redhat.com>,
        "util-linux@vger.kernel.org" <util-linux@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 4 Jan 2020 at 10:46, Jinke Fan <fanjinke@hygon.cn> wrote:
>
> Hi Mike,
> The root cause of the bug you encountered is unclear.
>

=3D=3D=3D cutted =3D=3D=3D

>
> There is no date reset found in the bios after reboot.
> The first time during OS startup get date from rtc_cmos is:
> [    1.589157] rtc_cmos 00:03: setting system clock to
> 2020-01-04T04:07:01 UTC (1578110821)

> I watched the video on youtube. The date is reseted when startup into
> bios at Mike's platform.
> As we know that the bios will check the validity of rtc time, if not,
> bios will reset the rtc time. RTC time reset may be done by the BIOS.

Did you disable automatic time synchronization?
By default Fedora GNOME doing automatic time synchronization.
For this reason, it=E2=80=99s more correct to immediately go into the BIOS
after a reboot and there check the time value or turn off automatic
time synchronization

--
Best Regards,
Mike Gavrilov.
