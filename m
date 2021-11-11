Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7420744D346
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 09:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhKKIk4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 03:40:56 -0500
Received: from smtp2.axis.com ([195.60.68.18]:16047 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229674AbhKKIkz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 11 Nov 2021 03:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636619887;
  x=1668155887;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=dY8b38RyIn9lW0od0tLB8bKC42O3hxXYDV3J/r3mQWo=;
  b=FjyGTwHZqQF3VH3z8mJmixvhBfL7fRs1Hp+c9b/H8oHfdDLXIC0VdfCo
   yWh+aeICH2R6N4IrMVoJcEB7XxQcMV8PQSFahpVSKut1UIobYFf160D1X
   7X/HNhUG1VetHnlge1NZwVrdu4+CHhvIl/o56MgFm53FRAmBMvPG/esMa
   XKAbXEhmyNUhcbhhtWfpUZ5hL7bR4SekaKVNjRLL3yyQZPVmGAn11cUFS
   Y1gcwKziv34Xc8so5cDySZZOMFRwIEWe9N3RjXO1wHA7RNtuOCtkmRKFX
   G6MTgVwbSLlPw4NwQA6nfZjlNu2w1huJ+3Nm++OkU1cOvC2AYiOg4GMfX
   Q==;
Subject: Re: [PATCH] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
To:     Camel Guo <Camel.Guo@axis.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>, kernel <kernel@axis.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211110115455.18699-1-camel.guo@axis.com>
 <YYvPCehWWVE5mKTy@piout.net> <2303e635-dbd0-1730-cc6f-84021eb37223@axis.com>
 <YYvW3T3wM/Qn5jSw@piout.net> <fa032379-2ca6-f5ca-0e84-91ae13a19488@axis.com>
From:   Camel Guo <camelg@axis.com>
Message-ID: <ef97a241-d211-6114-e9fe-6e3b48d7643a@axis.com>
Date:   Thu, 11 Nov 2021 09:38:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fa032379-2ca6-f5ca-0e84-91ae13a19488@axis.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail03w.axis.com
 (10.20.40.9)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/21 3:30 PM, Camel Guo wrote:
> Hello,
> 
> On 11/10/21 3:27 PM, Alexandre Belloni wrote:
>> On 10/11/2021 15:03:49+0100, Camel Guo wrote:
>>> > On 10/11/2021 12:54:54+0100, Camel Guo wrote:
>>> > > From: Camel Guo <camelg@axis.com>
>>> > > +     switch (cmd) {
>>> > > +     case RTC_VL_READ:
>>> > > +             flags = 0;
>>> > > +
>>> > > +             switch (rs5c->type) {
>>> > > +             case rtc_r2025sd:
>>> > > +             case rtc_r2221tl:
>>> > > +                     if ((rs5c->type == rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP)) ||
>>> > > +                             (rs5c->type == rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))) {
>>> > > +                             flags |= RTC_VL_DATA_INVALID;
>>> > > +                     }
>>> > > +                     if (ctrl2 & R2x2x_CTRL2_VDET)
>>> > > +                             flags |= RTC_VL_ACCURACY_LOW;
>>> > 
>>> > Shouldn't that be RTC_VL_BACKUP_LOW?

Fixed in V3.

>>> 
>>> Some drivers (e.g: rv3029_ioctl and rv8803_ioctl) use RTC_VL_ACCURACY_LOW,
>>> but some other drivers (e.g: abx80x_ioctl, pcf2127_rtc_ioctl and
>>> pcf8523_rtc_ioctl) use RTC_VL_BACKUP_LOW instead. Is there any guideline or
>>> document telling the differences between them?
>>> 
>> 
>> RTC_VL_BACKUP_LOW: The backup voltage is low
>> RTC_VL_ACCURACY_LOW: the primary or backup voltage is low, temperature
>> compensation (or similar) has stopped
> 
> Then I agree that we should go for RTC_VL_BACKUP_LOW.

Fixed in V3.

> 
>> 
>> -- 
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

All comments are fixed in V3, please review it again.

