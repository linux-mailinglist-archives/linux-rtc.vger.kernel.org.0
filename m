Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086F2266739
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Sep 2020 19:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgIKRkQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Sep 2020 13:40:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35725 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgIKMpc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Sep 2020 08:45:32 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A36C960007;
        Fri, 11 Sep 2020 12:44:12 +0000 (UTC)
Date:   Fri, 11 Sep 2020 14:44:12 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] rtc: rx8010: fix indentation in probe()
Message-ID: <20200911124412.GE230586@piout.net>
References: <20200904152116.2157-1-brgl@bgdev.pl>
 <20200904152116.2157-8-brgl@bgdev.pl>
 <20200904154144.GL230586@piout.net>
 <CAMpxmJWwNfLvpuB_1ba037UzVX9UEz7SzDEJuft0jv3txGRJQg@mail.gmail.com>
 <20200911122837.GC230586@piout.net>
 <CAMRc=MfzGgNR_vOqgDvQGCTQMiVbbiV_OKCOg61z-8B-mEuFyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfzGgNR_vOqgDvQGCTQMiVbbiV_OKCOg61z-8B-mEuFyQ@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/09/2020 14:33:46+0200, Bartosz Golaszewski wrote:
> I'm seeing this pattern elsewhere in the kernel too and I just
> recently fixed this for MDIO. I think it's just a matter of people
> copy-pasting a bad implementation.
> 
> > was an actual reason this was done this way and it was the ordering of
> > the rtc_nvmem_register/rtc_nvmem_unregister with rtc_device_unregister.
> > I'm not sure this is still necessary though.
> >
> 
> To me - each of these should have their own 'unregister' function and
> appropriate devres helpers *OR* RTC-related nvmem structures could be
> set up and assigned to struct rtc_device after
> devm_rtc_allocate_device() and picked up by the registration function
> (and also undone by rtc_unregister_device()).
> 
> I'll try to allocate some time to look into this but it's not like
> it's urgent or anything - it's just a potential improvement.
> 

Well, this could simply be done by adding a devres_add in
__rtc_register_device. I'm planning to remove rtc_nvmem_unregister after
the next LTS which will make that even easier.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
