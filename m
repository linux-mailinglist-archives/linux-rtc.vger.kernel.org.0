Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B5F3B6710
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Jun 2021 18:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhF1Qy3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Jun 2021 12:54:29 -0400
Received: from [115.28.160.31] ([115.28.160.31]:51260 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S231974AbhF1Qy3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Jun 2021 12:54:29 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F3E7C6010C;
        Tue, 29 Jun 2021 00:46:15 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1624898776; bh=KyFmzNY9iME7gAnoVZLtCu1aHJKWM5wIRQgf7jjbe/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ve74BQ/WsyHuxzh5nINc4HEDbzECypY58msalxUyNeix1ujcpAzyi3ZK4jlom1o8F
         ShfsX9dfjoFIfnziBGSMAxYwc5m0A7YOwpIxSuV0a5KVnDnG6pT2ZZb8v4ILXY4P9z
         HG7gXyGfFIiqqbOm2B4oim7fKP+aSaG0OBtEUgA0=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: rtc: Add bindings for LS2X RTC
Date:   Tue, 29 Jun 2021 00:45:48 +0800
Message-Id: <20210628164552.1006079-3-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210628164552.1006079-1-git@xen0n.name>
References: <20210628164552.1006079-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Document the binding for the LS2X RTC block found on the Loongson-2K SoC
and the LS7A bridge, originally appearing on the Loongson-2H.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 7548d8714871..568aa89989fe 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -42,6 +42,8 @@ properties:
       - isil,isl1218
       # Intersil ISL12022 Real-time Clock
       - isil,isl12022
+      # Loongson LS2X RTC
+      - loongson,ls2x-rtc
       # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3028
       # Real Time Clock Module with I2C-Bus
-- 
2.30.1

