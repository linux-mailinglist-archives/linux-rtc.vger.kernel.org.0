Return-Path: <linux-rtc+bounces-6018-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBtOE8GRm2k82QMAu9opvQ
	(envelope-from <linux-rtc+bounces-6018-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 00:31:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8F170C80
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 00:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9633E300DF65
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 23:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9D435C1A5;
	Sun, 22 Feb 2026 23:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MoCRWPdN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8FR7jL2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2B518C33
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 23:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771803065; cv=none; b=EMhZHr+9MbIIuCu2JJOiSm8IpsUF1EsLoY8yXH7Rogpmb1RrPgivb9HZVw6Y7wQTwAftg35ZdZXzaWg69ZypCVv6XFKBu7670JcPcGcnd3d5dNbNeHKsyRiA88XwipqhzkkF7P5p47eAPZvLf9zcXyLSaNumxF8aJMO8XmJD5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771803065; c=relaxed/simple;
	bh=8pBsKEH20JSamT4pu0G+VFsMWGlFjGy3IupsYd4O01o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GSkecrnzR0PB98PQ8bWMILvakPLbNQIWITmnDDhnL/fDG2jamiQTlCS3IzLFTsf/468ngizMmXQxfrQ1MMJWrecxDXzde07fSLuDLrUSmUqQPo/p1ZVre0ECUeEL107d2WkASn4heg9K77PeUdbioB/jFl7t0dcX2BK6ovqRsvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MoCRWPdN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8FR7jL2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771803062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Ik2DtS8unJrumP6g+Am6rbiRRcjuBLMHqEELAnJBwY=;
	b=MoCRWPdN2Fhxs2mc8qay3ZBcs32XWQkzRrtasghLK1yMRYDQmbbDV1mC3HWU7WBhvt+jAP
	CN0qdpovJQGI1iX+D3QgSc7rxpJx48dBRzm2/IUKLwzAWYaqZgk4JOimFtYd1X7ZGC/5z8
	wtIdEPh7cX9KwwHWrP+l7nl6JzqFLpk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-yhsH1HjRNuG9aUk0GXKqtg-1; Sun, 22 Feb 2026 18:31:01 -0500
X-MC-Unique: yhsH1HjRNuG9aUk0GXKqtg-1
X-Mimecast-MFC-AGG-ID: yhsH1HjRNuG9aUk0GXKqtg_1771803061
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503342386c7so504353031cf.0
        for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 15:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771803061; x=1772407861; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ik2DtS8unJrumP6g+Am6rbiRRcjuBLMHqEELAnJBwY=;
        b=W8FR7jL2TvMWIfDWU4nif7gjowC3GIuB7wcrI4omG8QIEYyVEwp8BONptxzREE+x1E
         N6xLAYHShinKSjYG4R8qOIcav6mpfggZvI6jurUCwa+2rWC9k5mb2BQPMQa3XdeyXFl3
         GSU/yaQBMclPA+2sK38bMcqEUpEeFM8Q7kWkRwlOZ+ME2w3XmkmG2UcxGpSNxnlXx70x
         fn55AAW6kSWHKizYRb+Z10RiaONDti/gEk6J7iXfiaUcdzgSK8lh6tlCsZZNR6MKiN45
         mY02d9ZYvNfRcFHTu+/Tf/xEDOlks5Yvcvr8koFLTBNJAIqOoEkC3na/0838XBObuEDv
         4c7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771803061; x=1772407861;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ik2DtS8unJrumP6g+Am6rbiRRcjuBLMHqEELAnJBwY=;
        b=Rr/D4l8wCTszZkc8LmQjFEDbkYcBzYs05RndmO7kFEFij2/4zvNb16QKacgwlevqTR
         KHBwlVTED2O21Rvm0dvicbl9XFvt9v1wvdXy8CJn5wnIIt68hUfYTDJr/fHdatGIJmU+
         GFCKdhge9WSF1VRWYdFrZSvtTGiiQSryDts4sqhUBX7pRGkl9usoFNLHThO9cZQjCNWJ
         +H/+f+Gy8nK/kwCw/vksxHA3gQzOIv0txMD1I0f6JrtM+MStkUBassWGTILW07tUjV/l
         Qv7BIaYsf3Qg0SL2D+U1Iibin6YBRi+gJAsl/b2i5GfDBkR1oTTbKed8cnHC8uO+Gt29
         Nhlw==
X-Gm-Message-State: AOJu0YxGWe15N4uruMT6CDuiOMZdi8fLCmnSJWX9yQafDf8YFvp+Jopd
	BBCFMivKxzlt8Aa3oAUH7DdaEwV/Ss7P7slgYkHvBEyMLRoGIkikcu1ORyjYtJrS9Jt2NGN8bMl
	ETwDURZkD006ucOCGTEtkEG58a/gf1y1dLWpZ5tjR2KxHOKxHub2844b/c6vfAw==
X-Gm-Gg: AZuq6aLiJtU9bksw9j9X8uYvnGz/G+dFWfuKgXQWPci1Yb3hLrczXr4CR+IVT+REDnC
	IIa6JcAdehY37MKpe7v1cCo4tFjDDstaK7mweNZbhuwdqHod4IPBMuVKv9T35B3SCpOuoBdp+Cv
	Lsh5xFq6R1bsmhNJx6j90cu2aYYH2GAHS4CXPQ5PXt+zjtLB6YTz+n105QjKljPLFUS0z9IOdTs
	+dbGrs0xZ/AwCikJqWZfcRUA005KCYuRBjmoLL+Crie37Ml4y+YETioYuiQqDTxIGwqDJJjB2S7
	sSUZ9hYUODYIFxbF+cgCMHXSwncXoj59YpsyEGMhMU6tWN+8CNfN0WsBb1RNE5L2qmgv3mXJu3+
	cfFoDnRm+iyia7mhMclnMQ218oeD4GLksiH0Y9XyMq96zM95Rz9YbX9ZZRFug+w==
X-Received: by 2002:a05:622a:134f:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-5070bba68a6mr85789761cf.19.1771803061021;
        Sun, 22 Feb 2026 15:31:01 -0800 (PST)
X-Received: by 2002:a05:622a:134f:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-5070bba68a6mr85789531cf.19.1771803060618;
        Sun, 22 Feb 2026 15:31:00 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d12013csm655364485a.43.2026.02.22.15.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:31:00 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:30:51 -0500
Subject: [PATCH] rtc: pic32: allow driver to be compiled with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-rtc-pic32-v1-1-3f8eb654a34d@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMj3aKSZN2CzGRjI9205FTL5FRDS3NTY1MloPqCotS0zAqwWdGxtbU
 Av00IT1sAAAA=
X-Change-ID: 20260222-rtc-pic32-fce9ce197535
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=8pBsKEH20JSamT4pu0G+VFsMWGlFjGy3IupsYd4O01o=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnT9x0ctP0f1OanrFahN4KitEv+s/jsyX2xT+7T7uqd
 LmZdk+N6yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAigfIMf7huBa0uqza4dWDl
 a873X+1lrxTHBX7+cr7K+nNBj/Ln506MDHOM/2insK1d+PjFw3N+7vfePrfrtlvZ9sH91cFiTqn
 7TBwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6018-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E3C8F170C80
X-Rspamd-Action: no action

This driver currently only supports builds against a PIC32 target. Now
that commit ed65ae9f6c6b ("rtc: pic32: update include to use pic32.h
from platform_data") is merged, it's possible to compile this driver on
other architectures.

To avoid future breakage of this driver in the future, let's update the
Kconfig so that it can be built with COMPILE_TEST enabled on all
architectures.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index b46ac73a2124e62f9232e9667da91fcb7ce36a62..364afc73f8abd2ade7e7570ba59c0f1aa0bbe78e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1986,7 +1986,7 @@ config RTC_DRV_XGENE
 
 config RTC_DRV_PIC32
 	tristate "Microchip PIC32 RTC"
-	depends on MACH_PIC32
+	depends on MACH_PIC32 || COMPILE_TEST
 	default y
 	help
 	   If you say yes here you get support for the PIC32 RTC module.

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260222-rtc-pic32-fce9ce197535

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


