Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E902312E663
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jan 2020 14:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgABNOo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jan 2020 08:14:44 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44529 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728165AbgABNOn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Jan 2020 08:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577970882;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eICqUZWHS7swGBDV3nYGnBDUTKdhLfVD0+54z2FAMDU=;
        b=Mm+4jZJVAfqHsBJJc3GVtJ/Yg7MWxEllcREg2WTSGxscYl+5kW2VzGsPykTfOnhTUahbIh
        oVUpctA0gWfBMyK9zYVu8wyYLy+FQ7xs6OHS/yRCNHRfzGKoBm40/a4fylrPZfwIM7wF9R
        XPPGvljy2p2/rzLZOenUs0r0ag5yjq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-ro_Lx_qPM8CH5w8VCS-2AA-1; Thu, 02 Jan 2020 08:14:39 -0500
X-MC-Unique: ro_Lx_qPM8CH5w8VCS-2AA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 914A7593A0;
        Thu,  2 Jan 2020 13:14:38 +0000 (UTC)
Received: from 10.255.255.10 (ovpn-204-196.brq.redhat.com [10.40.204.196])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 732A860BF4;
        Thu,  2 Jan 2020 13:14:37 +0000 (UTC)
Date:   Thu, 2 Jan 2020 14:14:34 +0100
From:   Karel Zak <kzak@redhat.com>
To:     Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc:     util-linux@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right
 time
Message-ID: <20200102131434.tky2hquki23laqqo@10.255.255.10>
References: <CABXGCsODr3tMpQxJ_nhWQQg5WGakFt4Yu5B8ev6ErOkc+zv9kA@mail.gmail.com>
 <20200101141748.GA191637@mit.edu>
 <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10>
 <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jan 02, 2020 at 04:55:32PM +0500, Mikhail Gavrilov wrote:
> # hwclock -w -v
> hwclock from util-linux 2.35-rc1-20-63f8
> System Time: 1577964536.796672
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Last drift adjustment done at 1577950892 seconds after 1969
> Last calibration done at 1577950892 seconds after 1969
> Hardware clock is on UTC time
> Assuming hardware clock is kept in UTC time.
> RTC type: 'rtc_cmos'
> Using delay: 0.500000 seconds
> missed it - 1577964536.797135 is too far past 1577964536.500000
> (0.297135 > 0.001000)
> 1577964537.500000 is close enough to 1577964537.500000 (0.000000 < 0.002000)
> Set RTC to 1577964537 (1577964536 + 1; refsystime = 1577964536.000000)
> Setting Hardware Clock to 11:28:57 = 1577964537 seconds since 1969
> ioctl(RTC_SET_TIME) was successful.
> Not adjusting drift factor because the --update-drift option was not used.
> New /etc/adjtime data:
> 0.000000 1577964536 0.000000
> 1577964536
> UTC

At first glance it seems hwclock works as expected, I do not see
anything wrong in the output.

> Demonstration: https://youtu.be/Yx27IH2opEc

What is hw time before reboot? Can you verify that hwclock reset the
clock? (or is it system reboot?)

    # hwclock -w -v
    # hwclock -v

Do you see anything interesting in dmesg output before reboot and after
hwclock -w? 


(CC: to linux-rtc@vger.kernel.org).

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com

