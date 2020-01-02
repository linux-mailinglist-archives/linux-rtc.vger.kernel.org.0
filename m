Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFBC12E931
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jan 2020 18:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbgABRQr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jan 2020 12:16:47 -0500
Received: from mail-il1-f177.google.com ([209.85.166.177]:35167 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgABRQr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Jan 2020 12:16:47 -0500
Received: by mail-il1-f177.google.com with SMTP id g12so34614675ild.2;
        Thu, 02 Jan 2020 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=egyXgieBs5c/58fAQVjRHfzS4DxpEu8BEyJ/qKWY5yY=;
        b=Pg7fbNui9RfYxQvdhHBfqpZMWRrdKqsMWbD4Jbdauim2JS3GH6VapXgC4MOQ2Yp/qC
         2sRxyssOPLh1zkb5qAPXbK8t5erANtYvScTa7Bq32wd3+dplBCC0nNOhJ3+qRtPb9IzM
         AU4fFD/7IkjeXmfq21MJTejKao/O9t2nKbtxMPi4wNER73mQaQJ32rQd/V+fr1dAN6WY
         TWicbi8tVsBFT2/ZRZoz8UCQzd47+cUaYfxsk1qioi0bKmTjxEGyxScjDvRX37t/Navp
         VsAssjemYKbQewu7UONx9fBHi7p0vq0dTKHAX0B5KCoSuv+ErhAujgAXTlq+nCDmA3mM
         5YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=egyXgieBs5c/58fAQVjRHfzS4DxpEu8BEyJ/qKWY5yY=;
        b=M1EJKXt/ZG2bl9rYwC974iGQ+OUnMSA2uCjS1IpjVShhGGfFzLQ+oOi+JmyWzobhHU
         zEM9zJmucRV1Gl/Sbzq6mx+kLM5Q5aKmPgxP5d7/6Jq9oYwTF3zG17dQxN9UW9QcjG+/
         twZ0npaYffSB1BYe3bcb3rQY7BjniVCFnCIuJYOu25JaF2FPgmZ4N18iAT35We1nQsmz
         QXi+gDYozCa5lOmuTODTywvx9zmjDh5thQ0nzZl3PTx0+P3/7NJTmVl46R4nMfrex5SG
         QkTrKx8y3LwixqqqLLQ3rxR3sIFcaGqxqHH85RRMFTNGfjFYdiLurGJSMjSUcHgwDNK0
         /x3A==
X-Gm-Message-State: APjAAAU17YZeJkZTbfLD8dl3ox53ds7t5nuS0Qh7xHH7j8Uq6asLOCSG
        vLKEepUCiA4PfnEwJPIyqNMjipDMYTyS/4gzwII=
X-Google-Smtp-Source: APXvYqyKycLnJtd/a3mZhrS7d6JA1iBR5zCVNBqkyizPlTijwrTjLaeUQuMHCF92LgwY98SaWjnvyLeWRPPA+VuwoYE=
X-Received: by 2002:a92:b6d1:: with SMTP id m78mr53509204ill.245.1577985406559;
 Thu, 02 Jan 2020 09:16:46 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsODr3tMpQxJ_nhWQQg5WGakFt4Yu5B8ev6ErOkc+zv9kA@mail.gmail.com>
 <20200101141748.GA191637@mit.edu> <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10> <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10> <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
 <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz>
In-Reply-To: <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz>
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Thu, 2 Jan 2020 22:17:26 +0500
Message-ID: <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right time
To:     J William Piggott <elseifthen@gmx.com>
Cc:     Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 2 Jan 2020 at 21:59, J William Piggott <elseifthen@gmx.com> wrote:
>
> You've demonstrated that 'hwclock -w' does not 'reset' the RTC.
>
> Does your new motherboard use a battery backup for the RTC?
> Is the battery good?
>

If you look carefully demonstration the RTC 'reset' happens after
reboot __only__ when 'hwclock -w' have been entered before reboot.
So if I reboot the computer without 'hwclock -w' the RTC will be not reset.

--
Best Regards,
Mike Gavrilov.
