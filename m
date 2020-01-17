Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42384140CDA
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 15:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgAQOmW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 09:42:22 -0500
Received: from mga05.intel.com ([192.55.52.43]:47075 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728852AbgAQOmW (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 17 Jan 2020 09:42:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 06:42:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; 
   d="scan'208";a="249268243"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2020 06:42:20 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1isSpI-0004yh-Tt; Fri, 17 Jan 2020 16:42:20 +0200
Date:   Fri, 17 Jan 2020 16:42:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        kernel@gpiccoli.net
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using
 HPET-based IRQ handler
Message-ID: <20200117144220.GU32742@smile.fi.intel.com>
References: <20200103140240.6507-1-gpiccoli@canonical.com>
 <20200108174111.GD32742@smile.fi.intel.com>
 <87h815ybxo.fsf@nanos.tec.linutronix.de>
 <4882eca9-c5dd-a37c-bc13-14108300fd92@canonical.com>
 <9b04b099-0495-d188-7002-cad1147b61d0@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b04b099-0495-d188-7002-cad1147b61d0@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 17, 2020 at 07:09:13AM -0300, Guilherme G. Piccoli wrote:
> Hi all, do we have any news about this one?
> Thanks in advance,

Let me come out with something such as Thomas suggested.

-- 
With Best Regards,
Andy Shevchenko


