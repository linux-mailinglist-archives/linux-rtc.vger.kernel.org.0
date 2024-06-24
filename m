Return-Path: <linux-rtc+bounces-1394-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 568729148F8
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 13:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EBB81F226C9
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 11:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FED139587;
	Mon, 24 Jun 2024 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="NDUT33qo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709E125D6
	for <linux-rtc@vger.kernel.org>; Mon, 24 Jun 2024 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229315; cv=none; b=Cxky2zmycLigSIz1TNdr8Xz58KWIgn7k0sKRY0zQ/AUK7/sHKJGInBD3WZeBxtqwr7O5Y8/I9Wbo/rojLJNwNnXc6IUH77E4UL7GHPgNMgsllOtnpmuGRj+lHtsZJoTqq3MwflYFzUPV8gMKe3CbZMa5LAoRJXOjehl26GafmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229315; c=relaxed/simple;
	bh=AijBxoAfmMIAkX73H7vl3+78cSiJ+jq7pp7HVYLFovg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DYZVwqC4frKEP32YQkK4DxuEiNWdWQkwD9mkV87SaM1m6pXsHnCgmQK3vl5Mb+DnEaCmQi0XXIx2XfS/oNbxlG5hY+10DgUWiRzA57JsSFPXbYPTcwTnO6aN8wdoNk1ORZAsqJm6994lYXAfd+HVdKyLN+GwPuXhuOVL1PmThWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=NDUT33qo; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1719229301; x=1721821301;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AijBxoAfmMIAkX73H7vl3+78cSiJ+jq7pp7HVYLFovg=;
	b=NDUT33qo3EilyGayT3njKZnpW84oPETD3HZrFJoQLo41ts19bUoLinpqr12Qhrxt
	Z7b8gHQV2JzI/X5NqMOJBIjzdz97iygTrkcsrafJDCKMtvdbqm+kWGVQltaILuWs
	wymXOSCioZaw489NNs+A5h/X8iqpK2nbGBN6Q2ZfG2A=;
X-AuditID: ac14000a-03251700000021bc-c4-66795b750406
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 93.C2.08636.57B59766; Mon, 24 Jun 2024 13:41:41 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 24 Jun
 2024 13:41:41 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Mon, 24 Jun 2024 13:41:41 +0200
From: Leonard Anderweit <L.Anderweit@phytec.de>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"arnd@arndb.de" <arnd@arndb.de>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@phytec.de" <upstream@phytec.de>
Subject: Question about [PATCH] [RFC] rtc: y2038: remove broken RTC_HCTOSYS
 workaround
Thread-Topic: Question about [PATCH] [RFC] rtc: y2038: remove broken
 RTC_HCTOSYS workaround
Thread-Index: AQHaxit7Na9swo4O+UmGER8BNQyYMw==
Date: Mon, 24 Jun 2024 11:41:41 +0000
Message-ID: <cf6ac9542f58a33b146ad7b0f5577e1dff3becab.camel@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FEC28AE4A6F8B48B788FEA61D7C15EE@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42JZI8nAq1saXZlmcGu9rkX7u2XsFn8nHWO3
	uLxrDpvFsdVX2BxYPH7/msToMW9NtcfnTXIBzFFcNimpOZllqUX6dglcGTNefWUruMNScXLb
	YpYGxjMsXYycHBICJhKv7p1k7mLk4hASWMIkceLxRyYI5z6jxIHrf6CcDYwSS38tYwJpYRPQ
	l1i54ikziC0ikCbxvHMmI0gRs8BKRomPU5axdzFycAgLREh0v7OCqImVOHflNRtIWERAT2Ld
	QwOQMIuAqkTXmbfsIDavgJvEo/btbCA2o4CsxIYN58HGMwuIS2x69p0V4lIBiSV7IOISAqIS
	Lx//g4rLS5y4NY0JZDyzgKbE+l36EK0WEtN3v2KDsBUlpnQ/hFolKHFy5hOWCYyis5BsmIXQ
	PQtJ9ywk3bOQdC9gZF3FKJSbmZydWpSZrVeQUVmSmqyXkrqJERRRIgxcOxj75ngcYmTiYDzE
	KMHBrCTCO72+LE2INyWxsiq1KD++qDQntfgQozQHi5I47+qO4FQhgfTEktTs1NSC1CKYLBMH
	p1QDo366lernqzz7nb7a5We3yRZt6JupGxDstzFq9XyrcE5lp81d3At/M827sO2VjknvjiXe
	amJxaowrJDcxldk/YWdkUX9Q/0qr7KJpSvCz5kObntxauPuU1s5vXMEzI7lnTlzl/W+NznHl
	WQUcc7zEmLfUMZZG7+/qZrN4vmmH54znkiZMzld/KrEUZyQaajEXFScCAPQzlQmWAgAA

SGksDQoNCkkgZm91bmQgdGhpcyBwYXRjaCBbMV0gd2hpY2ggaXMgbmVjZXNzYXJ5IGZvciBhIHBy
b2plY3QgSSdtIGN1cnJlbnRseQ0Kd29ya2luZyBvbi4gSSdtIHVzaW5nIHBoeWJvYXJkLXdlZ2Eg
WzJdIHdpdGggYW4gYW0zMzUgQVJNIFNvQyB3aGljaCBJDQp3YW50IHRvIG1ha2UgeTIwMzggcHJv
b2YuDQpJcyB0aGVyZSBhbnkgcmVhc29uIGl0IHdhcyBuZXZlciBhY2NlcHRlZD8NCg0KWzFdaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwOTA4MTE1MzM3LjE2MDQyNzctMS1hcm5kQGtl
cm5lbC5vcmcvDQoNCg0KWzJdaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtL2Jvb3QvZHRzL3RpL29tYXAv
YW0zMzV4LXdlZ2EtcmRrLmR0cw0KDQpSZWdhcmRzDQpMZW9uYXJkDQo=

