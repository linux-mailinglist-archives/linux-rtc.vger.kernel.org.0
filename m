Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623E03EED39
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Aug 2021 15:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237407AbhHQNVk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Aug 2021 09:21:40 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51071 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbhHQNVj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Aug 2021 09:21:39 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 53CB8200004;
        Tue, 17 Aug 2021 13:21:03 +0000 (UTC)
Date:   Tue, 17 Aug 2021 15:21:03 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     tonywwang-oc@zhaoxin.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, TimGuo-oc@zhaoxin.com,
        CooperYan@zhaoxin.com, QiyuanWang@zhaoxin.com,
        HerryYang@zhaoxin.com, CobeChen@zhaoxin.com, YanchenSun@zhaoxin.com
Subject: Re: [PATCH] rtc: Fix set RTC time delay 500ms on some Zhaoxin SOCs
Message-ID: <YRu3v0pb/Z54XxWJ@piout.net>
References: <1629121638-3246-1-git-send-email-TonyWWang-oc@zhaoxin.com>
 <YRogod0HB4d7Og4E@piout.net>
 <a4b6b0b4-9aa5-9a75-e523-0fd7656b82cf@zhaoxin.com>
 <YRpb4Fey2lM3aOAw@piout.net>
 <7EA395FF-EB66-4274-9EDE-EC28450A0259@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7EA395FF-EB66-4274-9EDE-EC28450A0259@zhaoxin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/08/2021 19:09:28+0800, tonywwang-oc@zhaoxin.com wrote:
> 
> 
> On August 16, 2021 8:36:48 PM GMT+08:00, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> >On 16/08/2021 18:03:13+0800, Tony W Wang-oc wrote:
> >> 
> >> On 16/08/2021 16:24, Alexandre Belloni wrote:
> >> > Hello,
> >> > 
> >> > On 16/08/2021 21:47:18+0800, Tony W Wang-oc wrote:
> >> >> When the RTC divider is changed from reset to an operating time
> >base,
> >> >> the first update cycle should be 500ms later. But on some Zhaoxin
> >SOCs,
> >> >> this first update cycle is one second later.
> >> >>
> >> >> So set RTC time on these Zhaoxin SOCs will causing 500ms delay.
> >> >>
> >> > 
> >> > Can you explain what is the relationship between writing the
> >divider and
> >> > the 500ms delay?
> >> >> Isn't the issue that you are using systohc and set_offset_nsec is
> >set to
> >> > NSEC_PER_SEC / 2 ?
> >> > 
> >> No.
> >> When using #hwclock -s to set RTC time and set_offset_nsec is
> >> NSEC_PER_SEC / 2, the function mc146818_set_time() requires the first
> >> update cycle after RTC divider be changed from reset to an operating
> >> mode is 500ms as the MC146818A spec specified. But on some Zhaoxin
> >SOCs,
> >> the first update cycle of RTC is one second later after RTC divider
> >be
> >> changed from reset to an operating mode. So the first update cycle
> >after
> >> RTC divider be changed from reset to an operation mode on These SOCs
> >> will causing 500ms delay with current mc146818_set_time()
> >implementation.
> >> 
> >
> >What happens with hwclock --delay=0 -s ?
> 
> With "hwclock --delay=0 -s" still have this problem. Actually, this 500ms delay caused by writing the RTC time on these Zhaoxin SOCs.
> As I've tested, with hwclock --delay=0 -w can fix it too. 
> 

Both -s and -w end up calling set_hardware_clock_exact() so both should
end up with the correct time. If this is not the case, then hwclock
needs to be fixed.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
