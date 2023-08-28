Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68FB978AEE6
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 13:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbjH1LbL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 07:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbjH1Law (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 07:30:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BFCE8;
        Mon, 28 Aug 2023 04:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693222249; x=1724758249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oDOg8YGynWkUP6TlFWW4Sii2F6kYhw9KTpKscsA6Jyw=;
  b=Fk7UPt5PW4Y4O94vS99SmoVXDTtZIekiUSpdoroGjHmFnvrWhQgHiQm1
   ir73zq+gIJ2Ef32I9IoycjyZ5xHmWhMemeohxXv1LvW25PQ/+28QvlMao
   S/Qesr1aYRsVv1l54ET+1Lce4PA03Qo+gh0wjKooifzoICwgheVQSuVEa
   +K0HfJxoFwvKuIsxeLdeWpy19gui0uu/BdQ+78cq3830UN9TN1RhSlf3D
   HCkehiXD2rUV18w1pJ6l2NtRBDc3ffQSSMR9cknaaB2KBCTqYKZTLC3zf
   A13k06tvpgb2rMLlsuTyA9Mqst174/Yy/ZAPPxURmGDEuvkMpsE4ZkeA5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461449862"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="461449862"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="828344516"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="828344516"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2023 04:30:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaSD-00GFdc-0p;
        Mon, 28 Aug 2023 14:30:45 +0300
Date:   Mon, 28 Aug 2023 14:30:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rtc: rs5c372: Simplify probe()
Message-ID: <ZOyFZf0/kFxS8rWc@smile.fi.intel.com>
References: <20230828111034.52764-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828111034.52764-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Aug 28, 2023 at 12:10:34PM +0100, Biju Das wrote:
> Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data().

...

>  	rs5c372->client = client;
>  	i2c_set_clientdata(client, rs5c372);
> -	if (client->dev.of_node) {
> -		rs5c372->type = (uintptr_t)of_device_get_match_data(&client->dev);
> -	} else {
> -		const struct i2c_device_id *id = i2c_match_id(rs5c372_id, client);
> -		rs5c372->type = id->driver_data;
> -	}
> +	rs5c372->type = (uintptr_t)i2c_get_match_data(client);

For better reading you can swap the order

	rs5c372->type = (uintptr_t)i2c_get_match_data(client);
	i2c_set_clientdata(client, rs5c372);

-- 
With Best Regards,
Andy Shevchenko


