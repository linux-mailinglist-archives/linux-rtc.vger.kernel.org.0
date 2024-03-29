Return-Path: <linux-rtc+bounces-901-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDF89169E
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 11:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 975B31C22071
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 10:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8289952F79;
	Fri, 29 Mar 2024 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="QWUo2zVz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4CA535A4
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711707615; cv=none; b=FCYt3tK1vICC8S4qIN1KQVOgS5EWVwhk5YSJmyPcLvqWgM99a4plNKnBbFlizS8k8fkEa6P900EksNliJvycH9JMufyF8vjAonHobF2EkqITePUneJZbSB3YkrnvYdYYSZ3qcOoCBt14bMOxq6SVdtYdebWe/gBZeVnnvK4Lb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711707615; c=relaxed/simple;
	bh=fuZByx8fzLgKEPKGZasvkuC5RywOXYCpi/Dnn5CXt2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CsPfTtVceH0QfZrxZbDUDaFU/7GvzvfCpGjoDI1T2KCRf6AFf0QFISUdc887FJhE9Elt1CDuu3tm1J8pWvMQ2/s7/ma9mpEqLgYOlHNo/7oKDvnNOE0nZ2vrbzQ+83+14D7oVNDKbCKMkljLqOlWFktbuMsfkbfQus34kBJ1Y6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=QWUo2zVz; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id pgkvrXEqQs4yTq9LGrTzMO; Fri, 29 Mar 2024 10:20:10 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id q9LDrN3UzQufZq9LFrMPjc; Fri, 29 Mar 2024 10:20:10 +0000
X-Authority-Analysis: v=2.4 cv=eK4Vjmp1 c=1 sm=1 tr=0 ts=660695da
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=K6JAEmCyrfEA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=fbhHIwXGltMNw4B7xfYA:9
 a=kn2rRUdfO8ZCmn3LMDoc:22 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UBMulemZbzLE4JR+qzWiUaTzOCoEImChdUYi/0nrLrA=; b=QWUo2zVzH8RFssCyT7ReqUEgxQ
	Bm1KEbEqkVhPypR7j2sbbgBaQSx9GWYbGENFRB+lPPSaxmpTPpAvV5DlH2d99bZVewKgaaEZyqCuG
	kZn/Yib/ex1ZY4WA9JrGG22vC65YVlYyGzVxJL9jEQ187vAr6AJy56WKkYu7n3aQCN/sjuEIqblTa
	41sUb2GNrZUG9osmiIrLHVfabpTjUuNPnFSowgzGuv8VHksQqe6+BFNc3YYnafAs9LEmYRVsuNIpl
	6x+Dc5vQJmFiQ/vO1iUZuQcc5P7j/7ePhQU4ZscosVzdsKpQProrAOMD+RkJ35eKFC9HR6SJzdUDL
	8dIkwQaQ==;
Received: from [122.165.245.213] (port=37812 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1rq9LC-000Rqk-2q;
	Fri, 29 Mar 2024 15:50:07 +0530
From: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	parthiban@linumiz.com,
	saravanan@linumiz.com,
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Subject: [PATCH] drivers: rtc: rv3028: check and update PORF flag during probe
Date: Fri, 29 Mar 2024 15:49:40 +0530
Message-Id: <20240329101940.1424643-1-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1rq9LC-000Rqk-2q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:37812
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNeHMApd4aviA2uAnkg91S4J6cFHdRNf8WzqPjIa/2lHYKTRZcMCEKJ7w7vjISLlo8xNUF5F2GDNqkfcGCZp7iNMdTrEWDttPfXMKL2l76ytzAW2TGiu
 5AYD+5yjDHS4v7YbPqHp0d/WJ0F2JDeICyr+1M4fOVYrYUU5wTwh21VcKCt13ldZtYtai/qRINZTTHpQbc58pO7s25bPhrJe2XY=

PORF flag is set during power reset and voltage drop below Vpor
data in rtc device is no longer valid if PORF flag is set
and software must reset to 0, in order to perform sanity
check on rtc data

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
 drivers/rtc/rtc-rv3028.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 2f001c59c61d..e9699ff0c4e8 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -951,6 +951,13 @@ static int rv3028_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	if (status & RV3028_STATUS_PORF) {
+		ret = regmap_update_bits(rv3028->regmap, RV3028_STATUS,
+					 RV3028_STATUS_PORF, 0);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (status & RV3028_STATUS_AF)
 		dev_warn(&client->dev, "An alarm may have been missed.\n");
 
-- 
2.34.1


