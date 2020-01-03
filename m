Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 823C312F69D
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2020 11:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgACKKi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Jan 2020 05:10:38 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:44099 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbgACKKi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Jan 2020 05:10:38 -0500
Received: by mail-io1-f50.google.com with SMTP id b10so40864714iof.11;
        Fri, 03 Jan 2020 02:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H7ccJ7jqob9X1a5Thw/teowqO4L2Ao67QeRijV6m1jE=;
        b=F93/L1zg225YarW3mLZ50Dlcb4ey5C9+fGU5X+lBN/vKm1tA1DV/AAvRI0tx2Ezl7k
         ZUQ/ttiSVg686kzFpYUIbKPbVCJd526HmLlBH7oOnUKhfzpizSFslXgZp4CjjMuphQxy
         dWTR65ZflEz8FY+6IgHBdRQI7E/N3CXn/lq2/+9TT26isb7QgPlWcPcxHkqdChhvVktU
         fUaJnVDXr4ZbCll6yFg4NsZmkvV91JFFD8CoznscBAAWX5JZOmO7bcMNtk+R2BBOD/rY
         Pwz6cCrGHb75OHf+UHUwtYccsrw4iOKe8stBUULkp4JXXhfLS5KR7t4nqUTrbRC+jUT3
         x00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7ccJ7jqob9X1a5Thw/teowqO4L2Ao67QeRijV6m1jE=;
        b=NEma381qYZJ/PxOLG7CD8Qj2wll4ebhXVjJPqrflu/vxa65bSbUuOvU3w15JnF7Zl4
         wzsBymWjHXrc9VXBlM3wL5WazkQhQAgjlz6X1SOSM0YkndQfcCFmIqUKDkngY9oJZz4E
         BXhqz88K+dgNu9tj4ykkeLcn0A6292v3AdimBnBwLeQg4AT3Vy7QgvJs2weRkeM+q90t
         iswY2L7LN2dVe8YrWbrlGV2A3KJEk543AYP2WXMsmo0wYvvpnPBzyByqA1vot1WDA2dI
         W/zRzUeVEv+rps+eevFcOwiXly2xj4bm3D3kRmQCduobhMizvpcJTe6Me602fcGZcaOo
         ecFQ==
X-Gm-Message-State: APjAAAVII5u7Dt56X9LqsLwxpiiFcT4r6yktTdILIXflF/oh4wBgoFch
        Fxx2UuO+7/lkZuEp+OVIQLT5ggQpSgZ8Mi/d7hA=
X-Google-Smtp-Source: APXvYqzoirVFEkvLnLrbRGGDO/o4BnbF+f5rjJo7DKON7UmYjhtvI2JnzVLCrNgHRY36E6prNQMfKa9mn0aCjxqwLhY=
X-Received: by 2002:a5e:a614:: with SMTP id q20mr49698151ioi.36.1578046237734;
 Fri, 03 Jan 2020 02:10:37 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsODr3tMpQxJ_nhWQQg5WGakFt4Yu5B8ev6ErOkc+zv9kA@mail.gmail.com>
 <20200101141748.GA191637@mit.edu> <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10> <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10> <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
 <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz> <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
 <20200103100232.GH3040@piout.net>
In-Reply-To: <20200103100232.GH3040@piout.net>
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Fri, 3 Jan 2020 15:11:17 +0500
Message-ID: <CABXGCsNv7G94TxaaKX8KXL5DEJiFgNcSu4+WShE_kQjVSa7zZA@mail.gmail.com>
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

On Fri, 3 Jan 2020 at 15:02, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> What is your kernel version?
>

$ uname -r
5.5.0-0.rc4.git0.1.fc32.x86_64


--
Best Regards,
Mike Gavrilov.
