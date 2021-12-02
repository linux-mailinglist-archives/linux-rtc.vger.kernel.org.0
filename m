Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604C3466C1A
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Dec 2021 23:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347662AbhLBW3i (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Dec 2021 17:29:38 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:51245 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235469AbhLBW3h (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Dec 2021 17:29:37 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A5925200007;
        Thu,  2 Dec 2021 22:26:13 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        otavio@ossystems.com.br, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/2 RESEND] dt/bindings: rtc: rx8900: Add an entry for RX8804
Date:   Thu,  2 Dec 2021 23:26:13 +0100
Message-Id: <163848397023.116856.13491227493256880540.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130125830.1166194-1-festevam@gmail.com>
References: <20211130125830.1166194-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 30 Nov 2021 09:58:29 -0300, Fabio Estevam wrote:
> The Epson RX8804 RTC has the same programming model as RV8803 and
> RX8900.
> 
> Add an entry for it in the binding document.
> 
> 

Applied, thanks!

[1/2] dt/bindings: rtc: rx8900: Add an entry for RX8804
      commit: 10d96b44a94e5cfd23739d2dcb950a7bdc109736
[2/2] rtc: rv8803: Add support for the Epson RX8804 RTC
      commit: 5c0189a8b52f76d8a061d2ec80adb11559742d78

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
