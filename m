Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523822B4621
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 15:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730323AbgKPOpb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 09:45:31 -0500
Received: from mga02.intel.com ([134.134.136.20]:26603 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728041AbgKPOpb (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 16 Nov 2020 09:45:31 -0500
IronPort-SDR: SV0RgNc9V2rbNdYojCQwX8E2WXzCOvvTGTZ4sbSHvSqun1dmrUzXVBzk0wNLVXRZllNAHxEDTN
 XDddjRaxYNsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="157780272"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="157780272"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 06:45:30 -0800
IronPort-SDR: 5OC54gy0gRe8XOTq+Vy7cP6Z9Lgy9X+1KcDyJ9xyyzZwQLChspDHQVniS6NuTI0gvKAFdp7B4u
 4B86Di3pjGMA==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="531869408"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 06:45:28 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kefm3-0075VI-35; Mon, 16 Nov 2020 16:46:31 +0200
Date:   Mon, 16 Nov 2020 16:46:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Claudius Heine <ch@denx.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>
Subject: Re: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <20201116144631.GB1689012@smile.fi.intel.com>
References: <20201112130734.331094-1-ch@denx.de>
 <20201112130734.331094-3-ch@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112130734.331094-3-ch@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 12, 2020 at 02:07:33PM +0100, Claudius Heine wrote:
> From: Johannes Hahn <johannes-hahn@siemens.com>
> 
> This allows the RX6110 driver to be automatically assigned to the right
> device on the I2C bus.

Before adding new ACPI ID, can you provide an evidence (either from vendor of
the component, or a real snapshot of DSDT from device on market) that this is
real ID?

Before that happens, NAK.

P.S. Seems to me that this is kinda cargo cult patch because proposed ID is
against ACPI and PNP registry and ACPI specification.

-- 
With Best Regards,
Andy Shevchenko


