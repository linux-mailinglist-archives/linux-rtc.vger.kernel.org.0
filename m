Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86450141053
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 18:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgAQR55 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 12:57:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:32056 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgAQR55 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 17 Jan 2020 12:57:57 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 09:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="220115256"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jan 2020 09:57:55 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1isVsa-0007u2-WB; Fri, 17 Jan 2020 19:57:56 +0200
Date:   Fri, 17 Jan 2020 19:57:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Guilherme Piccoli <gpiccoli@canonical.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using
 HPET-based IRQ handler
Message-ID: <20200117175756.GV32742@smile.fi.intel.com>
References: <20200103140240.6507-1-gpiccoli@canonical.com>
 <20200108174111.GD32742@smile.fi.intel.com>
 <87h815ybxo.fsf@nanos.tec.linutronix.de>
 <4882eca9-c5dd-a37c-bc13-14108300fd92@canonical.com>
 <9b04b099-0495-d188-7002-cad1147b61d0@canonical.com>
 <20200117144220.GU32742@smile.fi.intel.com>
 <CAHD1Q_y+9fK_CcmE7VF1XrATQA-Ru9O9=9XyGNvzxwu=Z-q9yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHD1Q_y+9fK_CcmE7VF1XrATQA-Ru9O9=9XyGNvzxwu=Z-q9yQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 17, 2020 at 11:57:08AM -0300, Guilherme Piccoli wrote:
> On Fri, Jan 17, 2020 at 11:42 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Let me come out with something such as Thomas suggested.
> >
> 
> Thank you Andy! In case it's gonna take a while (like more than 1
> kernel release), could we get this one accepted to mitigate the issue
> meanwhile?

I have just sent a series where first patch made to be fix and the rest is
some clean ups.

It would be nice if you can test first patch and series as a whole and
give your Tested-by tags.

-- 
With Best Regards,
Andy Shevchenko


