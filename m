Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0FBA1456E0
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 14:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgAVNix (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 08:38:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:43560 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgAVNix (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 22 Jan 2020 08:38:53 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jan 2020 05:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; 
   d="scan'208";a="220315883"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 22 Jan 2020 05:38:49 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iuGDa-0005Gp-FL; Wed, 22 Jan 2020 15:38:50 +0200
Date:   Wed, 22 Jan 2020 15:38:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     linux-rtc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/8] rtc: cmos: Use shared IRQ only for Microsoft
 Surface 3
Message-ID: <20200122133850.GK32742@smile.fi.intel.com>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
 <a4a30d2e-b7eb-0f2e-933d-97f5bb006428@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4a30d2e-b7eb-0f2e-933d-97f5bb006428@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jan 22, 2020 at 10:27:18AM -0300, Guilherme G. Piccoli wrote:
> On 17/01/2020 14:56, Andy Shevchenko wrote:

> Andy, thanks for the great patch! It works for me, I've tested it on top
> of 5.5-rc7, no more RTC lost interrupts while using the "irqpoll"
> parameter. So, feel free to add my:
> 
> Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Thank you for testing!

(Un)fortunately I dug a bit into the history of the patches and into the ACPI
tables of MS Surface 3. I have another (better) solution which I will send
separately from this series.

-- 
With Best Regards,
Andy Shevchenko


