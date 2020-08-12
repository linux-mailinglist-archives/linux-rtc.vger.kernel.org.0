Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610032427E0
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Aug 2020 11:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgHLJss (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Aug 2020 05:48:48 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49997 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgHLJss (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 Aug 2020 05:48:48 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DD22D60003;
        Wed, 12 Aug 2020 09:48:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Liam Beguin <lvb@xiphos.com>
Subject: Re: [PATCH] rtc: pcf2127: fix alarm handling
Date:   Wed, 12 Aug 2020 11:48:43 +0200
Message-Id: <159722570960.480982.2511953599425696473.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812085114.474903-1-alexandre.belloni@bootlin.com>
References: <20200812085114.474903-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 12 Aug 2020 10:51:14 +0200, Alexandre Belloni wrote:
> Fix multiple issues when handling alarms:
>  - Use threaded interrupt to avoid scheduling when atomic
>  - Stop matching on week day as it may not be set correctly
>  - Avoid parsing the DT interrupt and use what is provided by the i2c or
>    spi subsystem
>  - Avoid returning IRQ_NONE in case of error in the interrupt handler
>  - Never write WDTF as specified in the datasheet
>  - Set uie_unsupported, as for the pcf85063, setting alarms every seconds
>    is not working correctly and confuses the RTC.

Applied, thanks!

[1/1] rtc: pcf2127: fix alarm handling
      commit: 27006416be16b7887fb94b3b445f32453defb3f1

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
