Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD2F78AE80
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 13:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbjH1LKr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 07:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjH1LKa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 07:10:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FD1B0;
        Mon, 28 Aug 2023 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221028; x=1724757028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p6hEaijsT0I1wWsB+3/Ye+ikJnn7OosHOD1T0dCiVtk=;
  b=XwYzyB5vIhHC/+yhEmih1fQJ5VxixXL/74onc4kJLrmr8OISZtazy5EG
   IqXaxPZn85sSqFQE8ABSAmJCJrvZzIkF9+VjHjZFxTJn4/NmqWkfS71kW
   QaAXK4KYryiFjl3J9RKbSODJJCb1X/UaTnG+opNP8T8+MSMoAyl3b2mt7
   GLpmRH2wHpMPg1QAwk8u10KZ8C2plV7Xco7cz4CZcO2YYboVeAa6twMUV
   WxgHHNrRuTNLdroR/Bjdfw6HNL97llVuGQBNdIgCCgKmg1/A0U9nL2o/2
   8ZBQ9vBzPR98OQDhLs8hUW8oSIgdZ5B+9pCuFsXStjlJ7260bjYibwwD8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="360071528"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="360071528"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068999229"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1068999229"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 04:10:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaa8V-00Faeo-2S;
        Mon, 28 Aug 2023 14:10:23 +0300
Date:   Mon, 28 Aug 2023 14:10:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rtc: m41t80: Simplify probe()
Message-ID: <ZOyAn9xnqlai42bF@smile.fi.intel.com>
References: <20230828092737.30816-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828092737.30816-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Aug 28, 2023 at 10:27:37AM +0100, Biju Das wrote:
> Simplify probe() by replacing device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().

...

> +	m41t80_data->features = (unsigned long)i2c_get_match_data(client);

uintptr_t is more natural and de facto pattern for this. Why unsigned long
is here?


-- 
With Best Regards,
Andy Shevchenko


