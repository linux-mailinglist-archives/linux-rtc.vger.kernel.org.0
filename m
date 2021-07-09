Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18003C2BBA
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 01:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhGIXov (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 19:44:51 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57273 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhGIXov (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 19:44:51 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BB113240006;
        Fri,  9 Jul 2021 23:42:05 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, iwamatsu@nigauri.org
Subject: Re: [PATCH] rtc: pcf85063: Update the PCF85063A datasheet revision
Date:   Sat, 10 Jul 2021 01:42:05 +0200
Message-Id: <162587410279.1196349.9254321835367986590.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624120953.2313378-1-festevam@gmail.com>
References: <20210624120953.2313378-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 24 Jun 2021 09:09:53 -0300, Fabio Estevam wrote:
> After updating the datasheet URL, the PCF85063A  datasheet revision
> has changed.
> 
> Adjust it accordingly.

Applied, thanks!

[1/1] rtc: pcf85063: Update the PCF85063A datasheet revision
      commit: 98c25b8012461f569a4d20bc4a48c489099cf7fd

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
