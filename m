Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59313C1E98
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jul 2021 06:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhGIEsZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 00:48:25 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33829 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhGIEsY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 00:48:24 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id E537C32008C3;
        Fri,  9 Jul 2021 00:45:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 09 Jul 2021 00:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=qWSOt0gGfUpBv
        wE5RaWU1tB/jIDs+S806JHTjV04tWw=; b=MkaTpM+GahiUUnXbCpesJfnFbbGbB
        /c84WfQDNpQLNTqLSekYtFbnO/y/FogwqLeAHzIQ7OW06+xbwXo0zH06wkcBs/I+
        hQvD8xXFbIB+el4Uuuu8WH4w1tVlX6Xd9iDkJLPYWomidzdW0vwzaFrLfbkPy6Qr
        cglr+eNcZcu/MhutzxIozBzairgTKXtLrar3k12Ed1f9KtPi/ZAenowqeUM3KBME
        NQu50z3Y9h6ZFFfixExVBc3pa6lqvu9NAXRFtZimZnsmEgWzU4vfiLnuoObSpgVI
        lEJCkBhrWnRBGgsTMoo17Ntp1BEzUlTqrzU1SWEIO9ogiPmQCDY0+vadg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=qWSOt0gGfUpBvwE5RaWU1tB/jIDs+S806JHTjV04tWw=; b=JQJnq0R0
        WPKB2UFAnj6dIXlJj8yg2oByleUUpTBv6P+LKPtJRGe6DvV4cm7fkABqnd/w+nQp
        /FMa+4l3rDW/1NnzcPzl61hctOrCCnp/FBM17MjrLrubUzCEObWvFZ7kLp4MtnVV
        LqsmZyyOcuBWK77mBttTWUnBCrqIfeolOMW+zPPB1rQh1vmnryLy1rWSfkCF9zxE
        jEYtwSpkDgnqGYMLH73OkmMhxWrZL1a6ByeyPTWKjARFz/XFaOHNPhIRir5g/MJ6
        7gCXNOevAIuuRRqjOIJjemOHY6cXxoGPcgm1QwrNcgUo1KbLMUqN8F+UPveFcw1G
        jZYbq/IV6QKvDg==
X-ME-Sender: <xms:dNTnYHriaI8MjS8a0HJ5elzoYNfKmy6m8BHzTIEc_WcpLT8Y0DHKaw>
    <xme:dNTnYBomkCdP-sM5UlsXjAQCYBL7DytytJCylBr-SBqyzfdysZau9GoMPu0_QSTrS
    aFlc7xqyGybrSmmDy8>
X-ME-Received: <xmr:dNTnYEPt8_3Tat58Ibl0nqpRJ5C9FvdRtz_wV317Cv0bim3kFMuJTycc7GxGNMVUAe0EHl09x06Vtcusg0lETMegapD_28OWhg3_zYH1MJfcuRnDvDRupY9tMLB_FiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpeekleevteelvdduheetgfdvfeelueekffeggeethedtteeljeeivedv
    gfehjeejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:dNTnYK6jrWDwb-S959ZYH3IDvRNV7ymCamNaU1H1shRquelclSZgDw>
    <xmx:dNTnYG7JqC8hIfIhTJuCfwwG0jTx0QclB4phJbFhaZvdtWlsId8qDQ>
    <xmx:dNTnYCg0JYYz0eia2cU-3-2e8yuqqVTM4zeDV3YSrDTmUFRiDPzIEg>
    <xmx:dNTnYB1JITPrtFvMtWmhXDvq8kldf4qhcM5n-rvTZIK1W-8qnbtRuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 00:45:38 -0400 (EDT)
From:   Mathew McBride <matt@traverse.com.au>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2 2/2] dt-bindings: rtc: add Epson RX-8025 and RX-8035
Date:   Fri,  9 Jul 2021 04:45:18 +0000
Message-Id: <20210709044518.28769-3-matt@traverse.com.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210709044518.28769-1-matt@traverse.com.au>
References: <20210709044518.28769-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

These are supported by the rtc-rx8025 module. RX-8025
also has support in ds1307 due to compatible time registers.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 7548d8714871..13925bb78ec7 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -32,6 +32,9 @@ properties:
       - dallas,ds3232
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
       - epson,rx8010
+      # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
+      - epson,rx8025
+      - epson,rx8035
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
       - epson,rx8571
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
-- 
2.30.1

