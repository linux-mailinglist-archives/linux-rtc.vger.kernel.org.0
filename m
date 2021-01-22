Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C6F300781
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Jan 2021 16:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbhAVPip (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Jan 2021 10:38:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:35083 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728937AbhAVPiN (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 22 Jan 2021 10:38:13 -0500
IronPort-SDR: 4C1Cr2om+g38IFfI0/nEeN2aQFNT1hMKsabwgxgXXwnbFqPZlfrESpJ37b2LD994EbJJVpaVor
 DroEL8eakQsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="166561865"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="166561865"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 07:36:25 -0800
IronPort-SDR: b+m4vR5ChwGJw6XdsG77B1TdJEyEniIjPyFhM/cNbYq1cbaaE3NNClcMM6CzzW7wu3Pd1w9I8l
 BhPWdZIpFCOw==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="428001052"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 07:36:24 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2yV5-0094Rn-6T; Fri, 22 Jan 2021 17:37:27 +0200
Date:   Fri, 22 Jan 2021 17:37:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] rtc: mrst: Remove driver for deprecated platform
Message-ID: <YArxN6KF0R1Q8gMu@smile.fi.intel.com>
References: <20210122122226.38334-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122122226.38334-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 22, 2021 at 02:22:26PM +0200, Andy Shevchenko wrote:
> Intel Moorestown and Medfield are quite old Intel Atom based
> 32-bit platforms, which were in limited use in some Android phones,
> tablets and consumer electronics more than eight years ago.
> 
> There are no bugs or problems ever reported outside from Intel
> for breaking any of that platforms for years. It seems no real
> users exists who run more or less fresh kernel on it. The commit
> 05f4434bc130 ("ASoC: Intel: remove mfld_machine") also in align
> with this theory.
> 
> Due to above and to reduce a burden of supporting outdated drivers
> we remove the support of outdated platforms completely.

Dear maintainers, the idea is to get ack from you, so we can collect these
clean up patches in less amount of trees to reduce burden of the merging all
together w/o build conflicts.

-- 
With Best Regards,
Andy Shevchenko


