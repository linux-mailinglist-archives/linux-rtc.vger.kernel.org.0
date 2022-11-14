Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCB7628843
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Nov 2022 19:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbiKNSX4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Nov 2022 13:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236268AbiKNSX4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Nov 2022 13:23:56 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6823627DE4
        for <linux-rtc@vger.kernel.org>; Mon, 14 Nov 2022 10:23:54 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3A23EFF802;
        Mon, 14 Nov 2022 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668450230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2R8nXbga5weHJYGbfYa5FMGr1cFRmUXjDZTXuUSpjQc=;
        b=VG51cy4CM06vG+wgpG7VsbRqs4+SzBXILzKcXxZqBVlnmKeDeKAukDkiCP2U6iIQMiZkwJ
        RSiwrn8C1OMYxAo/K+T3oIICzKeRBegF94H8DPexNJ1BMsnMhHgeHgQYG8xtqjyS4zlSDJ
        /bo9NwC9wWgwNwAdzpBXXb5GF0FZI/9rG+K6VpZLEq+0lZyAfg8SuJ4TkcvvnFJhvsYRra
        Rd+mOLpIVL1KHBhXaTWZ4P4isynrihVUQBB05T3tLS1Gso1BOSz4AC3k7BZ5S6U2wn1IB+
        fY3fgbuqljt7+42sYGS0qPsxSg4GWcVpNvoc9pQtIhDjWD7Q0DWm6bxUcpl+aw==
Date:   Mon, 14 Nov 2022 19:23:49 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-rtc@vger.kernel.org
Cc:     a.zummo@towertech.it
Subject: Re: [PATCH -next] rtc: ds1302: remove unnecessary spi_set_drvdata()
Message-ID: <166845016719.2098091.9862932583350736533.b4-ty@bootlin.com>
References: <20220913144905.2004924-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913144905.2004924-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 13 Sep 2022 22:49:05 +0800, Yang Yingliang wrote:
> Remove unnecessary spi_set_drvdata() in ds1302_remove(), the driver_data
> will be set to NULL in device_unbind_cleanup() after calling ->remove().
> After this, ds1302_remove() is an empty function, so remove it too.
> 
> 

Applied, thanks!

[1/1] rtc: ds1302: remove unnecessary spi_set_drvdata()
      commit: eeb9d3b39c44d3824389d0cec8eabaac995822c9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
