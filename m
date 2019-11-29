Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D913010D7BB
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 16:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfK2POh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 10:14:37 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:53113 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfK2POh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 Nov 2019 10:14:37 -0500
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4CF33240052;
        Fri, 29 Nov 2019 15:14:34 +0000 (UTC)
Date:   Fri, 29 Nov 2019 16:14:29 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>, a.zummo@towertech.it,
        Srinivas Goud <sgoud@xilinx.com>, git@xilinx.com,
        linux-rtc@vger.kernel.org, champagne.guillaume.c@gmail.com,
        Maxime =?iso-8859-1?Q?Roussin-B=E9langer?= 
        <maxime.roussinbelanger@gmail.com>,
        Mathieu Gallichand <Mathieu.Gallichand@sonatest.com>
Subject: Re: [PATCH 2/2] rtc: zynqmp: fix invalid read_time before 1 second
Message-ID: <20191129151429.GY299836@piout.net>
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
 <20191128015613.10003-2-jeff.dagenais@gmail.com>
 <ca78b7e6-a0c3-745b-1533-6b8424d97623@xilinx.com>
 <CD70064B-5087-4A0F-9197-1F4A3DAA8B50@gmail.com>
 <20191128172957.GS299836@piout.net>
 <6C8E7EEC-A71D-48CE-8128-FACBD77EBD2E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6C8E7EEC-A71D-48CE-8128-FACBD77EBD2E@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/11/2019 09:45:39-0500, Jean-Francois Dagenais wrote:
> > Or does that mean that your previous read of control returning bit 24
> > set is also bogus?
> 
> https://www.xilinx.com/html_docs/registers/ug1087/rtc___control.html#
> Bits 30:28 are reserved, and not 0x0 as this reference page suggests, so who knows
> what the bits mean... well someone at Xilinx knows!
> 

According to this link, bit 24 is Crystal Enable which I would think
would also enable the RTC.

> > 
> > I ask because the simpler solution would simply to return -EINVAL in
> > xlnx_rtc_read_time when you detect a power on condition.
> 
> That could also work, but how would we determine that? Oh, perhaps by looking at
> the Battery_Enable (31) bit. But then we would need to keep it disabled during
> probe so that the time_read could test the bit to see if current_time is valid,
> and then after this, when would we enable it? Perhaps at the first call to
> set_time_write? This is all interesting but for now we have run out of time to
> investigate further. Unless someone comes up with a ready made alternative
> solution, we here are actually going to go into production with our patch. It
> works well.

Yes, this is exactly what should be done. leave the RTC in PON state
until userspace sets the time. Until then, -EINVAL must be returned by
.read_time.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
