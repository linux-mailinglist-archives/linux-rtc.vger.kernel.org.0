Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6F7346B17
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Mar 2021 22:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbhCWVa2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Mar 2021 17:30:28 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58597 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbhCWVaA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Mar 2021 17:30:00 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 68732E0002;
        Tue, 23 Mar 2021 21:29:58 +0000 (UTC)
Date:   Tue, 23 Mar 2021 22:29:58 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudius Heine <ch@denx.de>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        martin mantel <martin.mantel@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <YFpd1hkyJcDZ9jVb@piout.net>
References: <20210317075228.683184-1-ch@denx.de>
 <CAHp75VdRFqK6Tp+dFCHb_6ZBR32mNRLgyRKaMky43aoj1MOjcw@mail.gmail.com>
 <3215fc7e-ae1d-4e51-51d0-24ff386419bd@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3215fc7e-ae1d-4e51-51d0-24ff386419bd@denx.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/03/2021 10:32:39+0100, Claudius Heine wrote:
> Hi Andy,
> 
> On 2021-03-17 10:28, Andy Shevchenko wrote:
> > On Wed, Mar 17, 2021 at 9:56 AM Claudius Heine <ch@denx.de> wrote:
> > > 
> > > From: Johannes Hahn <johannes-hahn@siemens.com>
> > > 
> > > This allows the RX6110 driver to be automatically assigned to the right
> > > device on the I2C bus.
> > 
> > Thanks for an update!
> > 
> > > Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
> > > Co-developed-by: Claudius Heine <ch@denx.de>
> > > Signed-off-by: Claudius Heine <ch@denx.de>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > This is usually for patches that do fix found problems, here it's a
> > completely new item and the report was done in the middle of the
> > development. That said, you may give credit to LKP by just mentioning
> > it in the comments section (after the cutter '---' line). I'll leave
> > this to Alexandre and Alessandro to decide if you need a resend or
> > they may remove it when applying. (In my opinion resend is not needed
> > right now)
> Ok. Thanks a lot for your reviews and patience!
> 

I removed it when applying. Thanks for the work and the reviews!


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
