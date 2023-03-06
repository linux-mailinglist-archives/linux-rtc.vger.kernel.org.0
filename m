Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 600AB6ABA07
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Mar 2023 10:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjCFJha (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Mar 2023 04:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCFJh3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Mar 2023 04:37:29 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85073ABF
        for <linux-rtc@vger.kernel.org>; Mon,  6 Mar 2023 01:37:28 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3268e3Yi013010;
        Mon, 6 Mar 2023 03:37:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=yx89XbYbo2ayyKVzTM1XTk8n6bJRcj3bIZzeHiYfN7E=;
 b=TRCi/TrgZgiswDoD5nf2QEv4HnZX6RLwmi0YPb0x7UXUpqfqw8rOk8Hq7DbVC4fjoe5+
 tgBZ7DNXhbShEgzsvKIgPQuUnwUBDpbR1BojuPeX9CwYcWSAwLOTL1H5p8VBHJzK3Xv6
 0ph5hE5Hk9GBF5jsU2o1KYTg6+a78Ln7O+r62unHnr0jITgxiNT7AMsFQALbtNtoInJF
 jQVx60WVhIbv/4lENftqeAhF9Brq8HP5DgURT8QCh1pvro+goC68M1rI/MnHWcnDKVaV
 /7R4X8dbMAeYlMbl8JnFkkqP74D5yfkZFdLAwXnk4oQaSx56e01oPUsXHClN/qM5KfbL 7A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p44972bbh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Mar 2023 03:37:13 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 6 Mar
 2023 03:37:11 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 6 Mar 2023 03:37:11 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CBF69458;
        Mon,  6 Mar 2023 09:37:11 +0000 (UTC)
Date:   Mon, 6 Mar 2023 09:37:11 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <patches@opensource.cirrus.com>, <linux-rtc@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH 39/41] rtc: wm8350: Convert to platform remove callback
 returning void
Message-ID: <20230306093711.GR68926@ediswmail.ad.cirrus.com>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-40-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230304133028.2135435-40-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: yZhSlUVV6u7CMfAKk079X40MXTxCAkSN
X-Proofpoint-ORIG-GUID: yZhSlUVV6u7CMfAKk079X40MXTxCAkSN
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Mar 04, 2023 at 02:30:26PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
