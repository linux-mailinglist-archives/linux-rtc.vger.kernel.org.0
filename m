Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCD2C78AEE2
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 13:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbjH1LaG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 07:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbjH1LaD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 07:30:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A47EB3;
        Mon, 28 Aug 2023 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693222201; x=1724758201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vHnp2/IQ5U6V8Th0YHkhTUMFgbzI1ogURZnQJo/3Wek=;
  b=BLjSMOZwYWYgN6EWEDXEEs5rESsxrCif4892hNBW8V5vDi+4C1qwhfFw
   M69rIwkBll4IoSNoiJrpY9ss1QGFR9ogUX8czgbmr5Z0tuIYigk8wuN9i
   AJPMEiGlq/+jFKXBQLhW1lvsoyDzYP2aYvw3svmm3myF75frw+G1bKm8m
   mxCPjbtpgCBGpZKgu4DJ/kGsU1c3Ms1xZN9w/suhKgXEZtmQmoUvpBeIn
   zAutNjuXbx1FC5guO1+/2xEhCSkxyWGrnRlp64SlJNG2q15AWN0nQ2eDJ
   VsJfli67y6pja8CZwMasWHu7iz8i089Jc6mhZ+er1rLH9XYtEjbkks0ZB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="406068709"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="406068709"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="984852780"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="984852780"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2023 04:29:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaRR-00GDzA-1B;
        Mon, 28 Aug 2023 14:29:57 +0300
Date:   Mon, 28 Aug 2023 14:29:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] rtc: m41t80: Simplify probe()
Message-ID: <ZOyFNeMOxMenMdl0@smile.fi.intel.com>
References: <20230828092737.30816-1-biju.das.jz@bp.renesas.com>
 <ZOyAn9xnqlai42bF@smile.fi.intel.com>
 <OS0PR01MB592250E1368B54DEC421837A86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592250E1368B54DEC421837A86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Aug 28, 2023 at 11:13:29AM +0000, Biju Das wrote:
> > On Mon, Aug 28, 2023 at 10:27:37AM +0100, Biju Das wrote:

...

> > > +	m41t80_data->features = (unsigned long)i2c_get_match_data(client);
> > 
> > uintptr_t is more natural and de facto pattern for this. Why unsigned long
> > is here?
> 
> I just used the casting used for of_device_get_match_data.
> I will change it to uintptr_t, If there is no objection.
> 
> -		m41t80_data->features = (unsigned long)
> -			of_device_get_match_data(&client->dev);

Yes, but for new APIs the uintptr_t is natural (de facto).

-- 
With Best Regards,
Andy Shevchenko


