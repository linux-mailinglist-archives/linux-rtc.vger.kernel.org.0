Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830BE12F921
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2020 15:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbgACOXB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Jan 2020 09:23:01 -0500
Received: from mail-il1-f171.google.com ([209.85.166.171]:45346 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727523AbgACOXB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Jan 2020 09:23:01 -0500
Received: by mail-il1-f171.google.com with SMTP id p8so36695950iln.12;
        Fri, 03 Jan 2020 06:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qED4N6ZUDYtfo9BITi8Mnwcbhomm5A6OmBKaukUeGhg=;
        b=olaTHqTvzDjso1m69lqrpdw4IKlOE0ZFSWmc+msBK9p266jnx0FR5nDKwiRp+NxpxU
         ysn8unoZA7KV6ynQwnWzwYd65J8RCf3k6Qoc/Nm5cuyQarvFPkV016/OPCZ3EFtUuDZU
         sg4xy917dqmapqZ9kGD5gwOqxwbdCOMPcsuqsf25czAJk/wP2xHFKSOOk3vP4KNSwyx4
         DyuwjUmruHATE2GCDdQTO8zlKvR75S4HUpgDddHOG8l0fCRXSf0bRh4dwzAsSoNNC7f8
         2t+luRfaaQ3gCI3256ZRxArP0uYQHxqLouSyCneJaUM24EJtTTX96wwgP+FJZZCHhhKl
         nabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qED4N6ZUDYtfo9BITi8Mnwcbhomm5A6OmBKaukUeGhg=;
        b=aXLHGUZtKOt/RXr72WBvkcB9uX4u/FB1TM3HGJIRSEVvLM1Tehls3R1Y/bI+2s3sWa
         4UQCaHbfw5af5Ji8rEJG0Vu47+3BL2VBtylux0Arnbwzgv7KC3lyCQmPYL5C8kfYa88D
         4+afNmHH1W/TMPi5eeavKViYsESY0RfwM2O3ChQRZStjfEVgjoR6JmwUns61yMNp2XGK
         2v6I4qw2dUWQuI77GT+jzl8dIBtwD8nfsgXhUjyxkn0Lx6HLRWzeHSNTXY5XZCj5IqS4
         5Her4S/knQX/554Wut751cywhVKusFf5VsBXBehVEjftB0w4c2VCxlPnEHIOsTHnREjG
         xZDQ==
X-Gm-Message-State: APjAAAUnfM7Kd4J2HOMBa+xyxjxypL99/LUlZ6BzXe1stAtnYA81UHEm
        1m6mvyKPlOoMpnrbPJiB7CHydz0CafZU7Y7V22Y=
X-Google-Smtp-Source: APXvYqzV2ZZH9q21aYJjzk8pVqeb1NRANFoQMSgThdIhTSj2XAeXzxvr0OP+p6DhNf2Z4Ic193RLuF76z8m4WZJOSR0=
X-Received: by 2002:a92:58d7:: with SMTP id z84mr71808874ilf.179.1578061380500;
 Fri, 03 Jan 2020 06:23:00 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10> <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10> <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
 <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz> <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
 <20200103100232.GH3040@piout.net> <CABXGCsNv7G94TxaaKX8KXL5DEJiFgNcSu4+WShE_kQjVSa7zZA@mail.gmail.com>
 <20200103101935.GI3040@piout.net>
In-Reply-To: <20200103101935.GI3040@piout.net>
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Fri, 3 Jan 2020 19:22:49 +0500
Message-ID: <CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com>
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right time
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     J William Piggott <elseifthen@gmx.com>,
        Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 3 Jan 2020 at 15:19, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> I'm going to revert 7ad295d5196a58c22abecef62dd4f99e2f86e831, I think
> this will solve this issue.
>

Just checked kernel with reverted commit
7ad295d5196a58c22abecef62dd4f99e2f86e831,
and I can confirm that any time could be successfully set via 'hwclock -w'.
Thanks, waiting for the patch in master.

--
Best Regards,
Mike Gavrilov.
