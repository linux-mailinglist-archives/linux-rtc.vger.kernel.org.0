Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DA342FBC6
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242616AbhJOTOf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:14:35 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:43041 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbhJOTOf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:14:35 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EE94DE0007;
        Fri, 15 Oct 2021 19:12:26 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it
Subject: Re: [PATCH v2] rtc: class: check return value when calling dev_set_name()
Date:   Fri, 15 Oct 2021 21:12:22 +0200
Message-Id: <163432513382.815620.12291665932227521048.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012041629.2504158-1-yangyingliang@huawei.com>
References: <20211012041629.2504158-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 12 Oct 2021 12:16:29 +0800, Yang Yingliang wrote:
> I got a null-ptr-deref report when doing fault injection test:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> RIP: 0010:strcmp+0xc/0x20
> Call Trace:
>  __devm_rtc_register_device.cold.7+0x16a/0x2df
>  rv3029_probe+0x4b1/0x770 [rtc_rv3029c2]
>  rv3029_i2c_probe+0x141/0x180 [rtc_rv3029c2]
>  i2c_device_probe+0xa07/0xbb0
>  really_probe+0x285/0xc30
> 
> [...]

Applied, thanks!

[1/1] rtc: class: check return value when calling dev_set_name()
      commit: 24d23181e43d72ca692a479e70dfe5b0b5dd33f1

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
