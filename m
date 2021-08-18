Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F3D3EF8DF
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Aug 2021 05:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbhHRDzE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Aug 2021 23:55:04 -0400
Received: from ZXSHCAS1.zhaoxin.com ([203.148.12.81]:17416 "EHLO
        ZXSHCAS1.zhaoxin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236105AbhHRDzE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Aug 2021 23:55:04 -0400
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 18 Aug
 2021 11:54:27 +0800
Received: from [10.122.79.217] (221.11.61.182) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 18 Aug
 2021 11:54:25 +0800
Date:   Wed, 18 Aug 2021 11:54:20 +0800
From:   <tonywwang-oc@zhaoxin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <a.zummo@towertech.it>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <TimGuo-oc@zhaoxin.com>,
        <CooperYan@zhaoxin.com>, <QiyuanWang@zhaoxin.com>,
        <HerryYang@zhaoxin.com>, <CobeChen@zhaoxin.com>,
        <YanchenSun@zhaoxin.com>
Subject: Re: [PATCH] rtc: Fix set RTC time delay 500ms on some Zhaoxin SOCs
User-Agent: K-9 Mail for Android
In-Reply-To: <YRu3v0pb/Z54XxWJ@piout.net>
References: <1629121638-3246-1-git-send-email-TonyWWang-oc@zhaoxin.com> <YRogod0HB4d7Og4E@piout.net> <a4b6b0b4-9aa5-9a75-e523-0fd7656b82cf@zhaoxin.com> <YRpb4Fey2lM3aOAw@piout.net> <7EA395FF-EB66-4274-9EDE-EC28450A0259@zhaoxin.com> <YRu3v0pb/Z54XxWJ@piout.net>
Message-ID: <F4869089-9792-4C4F-B984-553662B03E91@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [221.11.61.182]
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On August 17, 2021 9:21:03 PM GMT+08:00, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>On 17/08/2021 19:09:28+0800, tonywwang-oc@zhaoxin.com wrote:
>> 
>> 
>> On August 16, 2021 8:36:48 PM GMT+08:00, Alexandre Belloni
><alexandre.belloni@bootlin.com> wrote:
>> >On 16/08/2021 18:03:13+0800, Tony W Wang-oc wrote:
>> >> 
>> >> On 16/08/2021 16:24, Alexandre Belloni wrote:
>> >> > Hello,
>> >> > 
>> >> > On 16/08/2021 21:47:18+0800, Tony W Wang-oc wrote:
>> >> >> When the RTC divider is changed from reset to an operating time
>> >base,
>> >> >> the first update cycle should be 500ms later. But on some
>Zhaoxin
>> >SOCs,
>> >> >> this first update cycle is one second later.
>> >> >>
>> >> >> So set RTC time on these Zhaoxin SOCs will causing 500ms delay.
>> >> >>
>> >> > 
>> >> > Can you explain what is the relationship between writing the
>> >divider and
>> >> > the 500ms delay?
>> >> >> Isn't the issue that you are using systohc and set_offset_nsec
>is
>> >set to
>> >> > NSEC_PER_SEC / 2 ?
>> >> > 
>> >> No.
>> >> When using #hwclock -s to set RTC time and set_offset_nsec is
>> >> NSEC_PER_SEC / 2, the function mc146818_set_time() requires the
>first
>> >> update cycle after RTC divider be changed from reset to an
>operating
>> >> mode is 500ms as the MC146818A spec specified. But on some Zhaoxin
>> >SOCs,
>> >> the first update cycle of RTC is one second later after RTC
>divider
>> >be
>> >> changed from reset to an operating mode. So the first update cycle
>> >after
>> >> RTC divider be changed from reset to an operation mode on These
>SOCs
>> >> will causing 500ms delay with current mc146818_set_time()
>> >implementation.
>> >> 
>> >
>> >What happens with hwclock --delay=0 -s ?
>> 
>> With "hwclock --delay=0 -s" still have this problem. Actually, this
>500ms delay caused by writing the RTC time on these Zhaoxin SOCs.
>> As I've tested, with hwclock --delay=0 -w can fix it too. 
>> 
>
>Both -s and -w end up calling set_hardware_clock_exact() so both should
>end up with the correct time. If this is not the case, then hwclock
>needs to be fixed.

I checked Util-linux-2.37.2, hwclock -w will call
set_hardware_clock_exact() and hwclock -s will not.
Please correct me if I'm wrong.

Sincerely
TonyWWang-oc
