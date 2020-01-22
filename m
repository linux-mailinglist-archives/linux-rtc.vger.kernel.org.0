Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C112145CC9
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 20:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgAVT6v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 14:58:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:48425 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgAVT6v (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 22 Jan 2020 14:58:51 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jan 2020 11:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; 
   d="scan'208";a="221327883"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jan 2020 11:58:48 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iuM9J-00011M-Q2; Wed, 22 Jan 2020 21:58:49 +0200
Date:   Wed, 22 Jan 2020 21:58:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Guilherme Piccoli <gpiccoli@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 1/3] rtc: cmos: Stop using shared IRQ
Message-ID: <20200122195849.GS32742@smile.fi.intel.com>
References: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
 <CAHD1Q_y2+DVPmqVLuSSqi6NQg8cTa2sbOWSQxGA_eqU6gQM5Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHD1Q_y2+DVPmqVLuSSqi6NQg8cTa2sbOWSQxGA_eqU6gQM5Bg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jan 22, 2020 at 02:32:01PM -0300, Guilherme Piccoli wrote:
> On Wed, Jan 22, 2020 at 11:45 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > [...]
> 
> Thank you Andy, great and simple series! I've tested that on top of
> 5.5-rc7 and it's working fine with "irqpoll" enabled.
> Feel free to add my:
> 
> Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Thanks!

> The only oddity here is about the scissors, I'm not sure how it is
> supposed to work on git, but when I git am'ed the patch, the commit
> message was only "As reported by Guilherme G. Piccoli:", everything
> else was dropped.

I didn't read any RFC or document about '--- ' line. But seems either bug in
git-am, or I have to put something else at the beginning of those lines.

-- 
With Best Regards,
Andy Shevchenko


