Return-Path: <linux-rtc+bounces-1419-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A614091B732
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 08:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDDF7B20DDE
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 06:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD417F7FC;
	Fri, 28 Jun 2024 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="hm1VF6ku"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF447F7C6
	for <linux-rtc@vger.kernel.org>; Fri, 28 Jun 2024 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719556429; cv=none; b=W2ICfc4btVd0P2eOrSseTvRKAciEObBNk3xjKWLD/JCtWiT2xlu6ypLdevAZS2CVTZHg+uNkyHIZm6caQL0hEgKAPlNJU0awpPWaailUuM1vXoEhNZRd9idKXJeVDvtY0SrEj3iI9kBxjtcKWJUtspxBQhZO7Q7uZwgx52MjamU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719556429; c=relaxed/simple;
	bh=ibvzQjGqWMhD5zSz39NVPOgfkdPneTdnLq92rExKqc0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MVzNHywGOiIY5O327SRsJIbq4fIo0RU2loHotLJFj3HjQF3lgGh5WhKWj0DGTd19IW7ofBk0cBuzlA/4Sy9jz5poaI107DiQfS1ERCbr5HvsZEK1IynUDMpnzvKwkZDBgVuz2fNMDc92Xu2aFsoYsmGmosj+exiyX7bUdWOI9XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=hm1VF6ku; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1719556416; x=1722148416;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ibvzQjGqWMhD5zSz39NVPOgfkdPneTdnLq92rExKqc0=;
	b=hm1VF6ku/27MUnKNHMTiv+Pl1aTPihQYrpC2nMUbvuxx8HffS5JZZbef/3dXUpkU
	NqeQByD/BA9gOJY58KNeU8qeqf76YKX04x4fD91WjQ8cTcJDNEpPfywIEN4ryKIO
	A8jNP/YCZZDJJGeQrv+UvtNONXroZsg+Xkkm0e1U4PU=;
X-AuditID: ac14000a-03e52700000021bc-b0-667e5940e65d
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 67.A9.08636.0495E766; Fri, 28 Jun 2024 08:33:36 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 28 Jun
 2024 08:33:35 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Fri, 28 Jun 2024 08:33:35 +0200
From: =?utf-8?B?U3RlZmFuIE3DvGxsZXItS2xpZXNlcg==?=
	<S.Mueller-Klieser@phytec.de>
To: Leonard Anderweit <L.Anderweit@phytec.de>, "arnd@arndb.de"
	<arnd@arndb.de>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@phytec.de" <upstream@phytec.de>
Subject: Re: Question about [PATCH] [RFC] rtc: y2038: remove broken
 RTC_HCTOSYS workaround
Thread-Topic: Question about [PATCH] [RFC] rtc: y2038: remove broken
 RTC_HCTOSYS workaround
Thread-Index: AQHaySUasisojj+uIEydYTC3JWr7Ng==
Date: Fri, 28 Jun 2024 06:33:35 +0000
Message-ID: <d8dea6f3123face56bf36d7df3a8eb1975ac214c.camel@phytec.de>
References: <cf6ac9542f58a33b146ad7b0f5577e1dff3becab.camel@phytec.de>
	 <20240627224321db4557b2@mail.local>
	 <1d82ecbb-c9fa-49e0-8432-7fd152e01440@app.fastmail.com>
In-Reply-To: <1d82ecbb-c9fa-49e0-8432-7fd152e01440@app.fastmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8F4007B0539CF4D826895C98E7CC5B4@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsWyRpKBR9chsi7N4NMOYYv2d8vYLf5OOsZu
	cXnXHDaLY6uvsDmwePz+NYnRY96aao/Pm+QCmKO4bFJSczLLUov07RK4Mq7+WMVc8ECqYsb5
	V+wNjB1SXYycHBICJhL7VzaxdTFycQgJLGGSuHrkAZRzn1Hi3KrNTBDOBkaJVfe3sHQxcnCw
	CQRJbPouDBIXEZjMKHGz+TlYEbPASkaJj1OWsYMUCQvESCy6kwCyQkQgVuLclddsELaexNp7
	09hASlgEVCVmbrcDCfMKuEm07TnGCrFrBaPEhmNvWEESnAIuErMm3mAEsRkFZCU2bDjPDGIz
	C4hLbHr2nRXiBQGJJXsg4hICohIvH/+DistLnLg1jQlkF7OApsT6XfoQrRYS3zfvY4KwFSWm
	dD9kh7hBUOLkzCcsExjFZyHZMAuhexaS7llIumch6V7AyLqKUSg3Mzk7tSgzW68go7IkNVkv
	JXUTIygGRRi4djD2zfE4xMjEwXiIUYKDWUmEN7SkKk2INyWxsiq1KD++qDQntfgQozQHi5I4
	7+qO4FQhgfTEktTs1NSC1CKYLBMHp1QD4ywOnhk3DI0jixSPuFhNv8V54laC1rq2ap/cQ+wn
	XX9+XvlzJcMzgy17n/5tkLoyae+BtR7p8ue+bV3gc3GX251yGZ+OxavPLPx0YNl160lGRa/m
	vL1e+WKhXODS+0azvKxyVY4pFW7MnHKVuyf8Ni/v2t8tjitfP5senbay4NC97h2i8zvWOIYq
	sRRnJBpqMRcVJwIAhrzjFa8CAAA=

QW0gRnJlaXRhZywgZGVtIDI4LjA2LjIwMjQgdW0gMDg6MDEgKzAyMDAgc2NocmllYiBBcm5kIEJl
cmdtYW5uOg0KPiBPbiBGcmksIEp1biAyOCwgMjAyNCwgYXQgMDA6NDMsIEFsZXhhbmRyZSBCZWxs
b25pIHdyb3RlOg0KPiA+IE9uIDI0LzA2LzIwMjQgMTE6NDE6NDErMDAwMCwgTGVvbmFyZCBBbmRl
cndlaXQgd3JvdGU6DQo+ID4gPiBIaSwNCj4gPiA+IA0KPiA+ID4gSSBmb3VuZCB0aGlzIHBhdGNo
IFsxXSB3aGljaCBpcyBuZWNlc3NhcnkgZm9yIGEgcHJvamVjdCBJJ20gY3VycmVudGx5DQo+ID4g
PiB3b3JraW5nIG9uLiBJJ20gdXNpbmcgcGh5Ym9hcmQtd2VnYSBbMl0gd2l0aCBhbiBhbTMzNSBB
Uk0gU29DIHdoaWNoIEkNCj4gPiA+IHdhbnQgdG8gbWFrZSB5MjAzOCBwcm9vZi4NCj4gPiA+IElz
IHRoZXJlIGFueSByZWFzb24gaXQgd2FzIG5ldmVyIGFjY2VwdGVkPw0KPiANCj4gU29ycnkgZm9y
IG5vdCBoYXZpbmcgcmVwbGllZCBlYXJsaWVyLiBJJ20gZGVmaW5pdGVseSBpbnRlcmVzdGVkDQo+
IGluIGhlbHBpbmcgdG8gbWFrZSB0aGlzIHdvcmsgYmV0dGVyLCBoYXZpbmcgc3BlbnQgYSBsb3Qg
b2YgdGltZQ0KPiBvbiB0aGUga2VybmVsIHNpZGUgb2YgdGhlIHkyMDM4IHdvcmsuDQo+IA0KPiBX
aGljaCBjb21iaW5hdGlvbiBvZiBkaXN0cm8sIGxpYmMgYW5kIGluaXQgc3lzdGVtIGFyZSB5b3Ug
dXNpbmcNCj4gaW4geW91ciB3b3JrPw0KDQpXZSBoYXZlIGEgWW9jdG8gc2NhcnRoZ2FwIHdpdGgg
Z2xpYmMgMi4zOSBhbmQgc3lzdGVtZCAyNTUuNC4NCg0KPiANCj4gQXJlIHlvdSBydW5uaW5nIHdp
dGggQ09NUEFUXzMyQklUX1RJTUUgZGlzYWJsZWQ/IFRoaXMgaXMgc29tZXRoaW5nDQo+IHlvdSBw
cm9iYWJseSB3YW50IGluIG9yZGVyIHRvIGJldHRlciB0ZXN0IGZvciBjb3JuZXIgY2FzZXMgdGhh
dA0KPiBzdGlsbCB1c2UgdGltZTMyIGtlcm5lbCBBQklzIHNvbWV3aGVyZSwgYnV0IGl0IHN0aWxs
IHJlcXVpcmVzDQo+IGFkZGluZyBhIGZldyBtb3JlIHdvcmthcm91bmRzIGluIGxpYmMgYW5kIG90
aGVyIHVzZXJzcGFjZQ0KPiBzb3VyY2VzLg0KDQpXZSB3YW50ZWQgdG8sIGJ1dCB0aGlzIHN0aWxs
IGtlZXBzIHN5c3RlbWQgZnJvbSBib290aW5nLiBXZSBhcmUNCmRlYnVnZ2luZyB0aGlzIGN1cnJl
bnRseS4NCg0KPiANCj4gPiBUaGUgc3lzdGVtZCBtYWludGFpbmVyIHRoaW5rIHRoZSBrZXJuZWwg
aXMgd2VsbCBwbGFjZWQgdG8gdGFrZSBhDQo+ID4gZGVjaXNpb24gaXQgY2FuJ3QgYWN0dWFsbHkg
dGFrZSBzbyB0aGV5IHdvbid0IGZpeCBhIGJ1ZyB3aGVyZSBzeXN0ZW1kIGlzDQo+ID4gY3Jhc2hp
bmcgd2hlbiB1c2Vyc3BhY2UgaXMgMzJiaXQuDQo+ID4gDQo+ID4gVGhlIHdob2xlIHNpdHVhdGlv
biBpcyBmcnVzdHJhdGluZyBhbmQgaG9uZXN0bHksIG5vYm9keSBzaG91bGQgdXNlIHRoZQ0KPiA+
IGhjdG9zeXMgaW5zYW5pdHkgYW55d2F5LiBPYnZpb3VzbHkgc3lzdGVtZCBtYW5kYXRlcyBpdHMg
dXNhZ2UgYW5kIHRoaXMNCj4gPiBpcyB5ZXQgYW5vdGhlciB0b3BpYyBvbiB3aGljaCB0aGV5IHRo
aW5rIHRoZSBrZXJuZWwgaXMgYmV0dGVyIHBsYWNlZCB0bw0KPiA+IHRha2UgZGVjaXNpb25zIHRo
YXQgYXJlIGFjdHVhbGx5IHVzZXJzcGFjZSBwb2xpY3kuDQo+ID4gDQo+ID4gSSd2ZSBiZWVuIGFy
Z3VpbmcgZm9yIGEgd2hpbGUgYW5kIGdhdmUgdXAuDQo+IA0KPiBJIHRob3VnaHQgdGhhdCBzeXN0
ZW1kIGhhZCBhdCBsZWFzdCBmaXggdGhlIGJ1ZyB3aGVyZSBpdCB3b3VsZA0KPiBjcmFzaCB3aGVu
IGEgcmFuZG9tIDY0LWJpdCB0aW1lIHdhcyBzZXQsIHNvIHdlIGNvdWxkIHRyeSBhZ2Fpbg0KPiB3
aXRoIHRoaXMgcGF0Y2ggYW5kIHNlZSB3aGF0IGJyZWFrcz8NCg0KV2l0aCB0aGUgcGF0Y2ggYW5k
IENPTVBBVF8zMkJJVF9USU1FIGVuYWJsZWQsIGl0IHNlZW1zIHRvIHdvcmssDQphdCBsZWFzdCBv
dXIgdGVzdCBjYXNlcyBkby4NCg0KPiANCj4gQW4gaW1wb3J0YW50IGRpZmZlcmVuY2Ugbm93IGlz
IHRoYXQgRGViaWFuIGlzIGZpbmFsbHkgY2hhbmdpbmcNCj4gdG8gYSB0aW1lNjQgdXNlcnNwYWNl
LCB3aGljaCBib3RoIGF2b2lkcyB0aGUgcHJvYmxlbSB0aGF0DQo+IHRoZSBicm9rZW4gcnRjX2hj
dG9zeXMoKSB0aW1lIHRydW5jYXRpb24gd2FzIHRyeWluZyB0byB3b3JrDQo+IGFyb3VuZCAoYWxs
IHRpbWVzIHJldHVybmVkIGhlcmUgYXJlIG5vdyB2YWxpZCkgYW5kIGl0IG1lYW5zDQo+IHRoYXQg
dGhlcmUgaXMgYSBtdWNoIGhpZ2hlciBpbmNlbnRpdmUgdG8gYWN0dWFsbHkgbWFrZQ0KPiBhIHN5
c3RlbWQgYmFzZWQgdXNlcmxhbmQgd29yayBwYXN0IDIwMzguDQoNCllvY3RvIGFsc28gc2VlbXMg
dG8gaGF2ZSB0aGUgYmFzaWNzIGluIHBsYWNlIGFuZCBzb21lIHNhbml0eSBjaGVja3MNCmF2YWls
YWJsZSBmb3Igc2NhcnRoZ2FwIGJ1dCBhcyBzYWlkLCB3ZSBjYW5ub3QgZGlzYWJsZSB0aGUgMzIg
Yml0IGFwaS4NClJlZ2FyZHMsIFN0ZWZhbg0KDQo+IA0KPiAgICAgICBBcm5kDQo+IA0K

