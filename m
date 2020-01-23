Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57537146309
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Jan 2020 09:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgAWIIZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Jan 2020 03:08:25 -0500
Received: from mga04.intel.com ([192.55.52.120]:62893 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAWIIY (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Jan 2020 03:08:24 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 00:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; 
   d="scan'208";a="250888691"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2020 00:08:23 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iuXXM-0008V2-CB; Thu, 23 Jan 2020 10:08:24 +0200
Date:   Thu, 23 Jan 2020 10:08:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Guilherme Piccoli <gpiccoli@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 1/3] rtc: cmos: Stop using shared IRQ
Message-ID: <20200123080824.GT32742@smile.fi.intel.com>
References: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
 <CAHD1Q_y2+DVPmqVLuSSqi6NQg8cTa2sbOWSQxGA_eqU6gQM5Bg@mail.gmail.com>
 <20200122195849.GS32742@smile.fi.intel.com>
 <CAHD1Q_yjtJAd1KMGKD9Oh3BWSM4OzAA8TkBcs7r1ci4FZW+tQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHD1Q_yjtJAd1KMGKD9Oh3BWSM4OzAA8TkBcs7r1ci4FZW+tQg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jan 22, 2020 at 05:05:15PM -0300, Guilherme Piccoli wrote:
> On Wed, Jan 22, 2020 at 4:58 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > [...]
> > > The only oddity here is about the scissors, I'm not sure how it is
> > > supposed to work on git, but when I git am'ed the patch, the commit
> > > message was only "As reported by Guilherme G. Piccoli:", everything
> > > else was dropped.
> >
> > I didn't read any RFC or document about '--- ' line. But seems either bug in
> > git-am, or I have to put something else at the beginning of those lines.
> >
> 
> Interesting! What I usually do is to add comments
> to-be-disregarded-on-merge right below "---", before the diff starts.
> Git will discard this full block. I guess probably having the "---" on
> top makes Git discard everything below it until the diff.

For the record it's '--- ' (mind the whitespace at the end).

> Anyway, hope your commit message don't get messed in the merge heh

I'll send a new version.

-- 
With Best Regards,
Andy Shevchenko


