Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909A12B4610
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 15:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730251AbgKPOmp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 09:42:45 -0500
Received: from mga18.intel.com ([134.134.136.126]:23726 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730250AbgKPOmp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 16 Nov 2020 09:42:45 -0500
IronPort-SDR: orcUgW/H4SHtHkjt5ZN4mbnN0nqGorYNUlgxSFsehrQaONAt2JbLO/cl0bu+ylf+OHi5vNi65h
 u/h7l3ehjVtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158530933"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="158530933"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 06:42:44 -0800
IronPort-SDR: mdZvDNgUeCjsSvi0aHbg0soGnpP3Z13ut53o5aklNIirNIucTupKd6nx4VlYduP2wmEOirqGP/
 Iq1me7rOn9zA==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="533435220"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 06:42:41 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kefjL-0075SL-DV; Mon, 16 Nov 2020 16:43:43 +0200
Date:   Mon, 16 Nov 2020 16:43:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Claudius Heine <ch@denx.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>
Subject: Re: [PATCH v2 1/3] rtc: rx6110: add i2c support
Message-ID: <20201116144343.GA1689012@smile.fi.intel.com>
References: <20201112130734.331094-1-ch@denx.de>
 <20201112130734.331094-2-ch@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112130734.331094-2-ch@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 12, 2020 at 02:07:32PM +0100, Claudius Heine wrote:
> The RX6110 also supports I2C, so this patch adds support for it to the
> driver.
> 
> This also renames the SPI specific functions and variables to include
> `_spi_` in their names.

As practice shows this is not the best approach. Can you ratqer split it to
three modules: core, spi, i2c like it's done in many other cases (esp. IIO)?

In Kconfig you just leave same option with two additional ones like

config ..._SPI
	tristate
	default SPI_MASTER
	depends on SPI_MASTER

config ..._I2C
	tristate
	default I2C
	depends on I2C

-- 
With Best Regards,
Andy Shevchenko


